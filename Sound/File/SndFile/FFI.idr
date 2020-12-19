module Sound.File.SndFile.FFI
import public Sound.File.SndFile.ForeignEnums
import Sound.File.SndFile.ForeignTypes
import Sound.File.SndFile.Bindings
import Memory.Management
import System.Path
import System.FFI

-- Wraps around Bindings, ForeignEnums and ForeignTypes
-- to provide a function interface to libsndfile.

Cast Bool Int where
    cast True = 0
    cast False = 1

Cast Int Bool where
    cast = intToBool

public export
data SoundFileError : Type where
    ||| Internal libsndfile error
    SoundFileErrorLibrary : (e : SoundFileLibError) -> SoundFileError

Eq SoundFileError where
    (SoundFileErrorLibrary e1) == (SoundFileErrorLibrary e2) = e1 == e2
    _ == _ = False

export
Show SoundFileError where
    show (SoundFileErrorLibrary e) = "libsndfile error: " ++ show e

---- Format and Info

maskHeader : Int
maskHeader = 0x0FFF0000

maskEncoding : Int
maskEncoding = 0x0000FFFF

maskEndian : Int
maskEndian = 0x30000000

xorAll : List Int -> Int
xorAll = foldr (prim__xor_Int) 0x0

record SoundFileFormat where
    constructor MkSFFormat
    header : SoundFileHeaderFormat
    encoding : SoundFileSampleEncoding
    endian : SoundFileEndian

Cast SoundFileFormat Int where
    cast (MkSFFormat h ec ed) = xorAll [cast h, cast ec, cast ed]

Cast Int SoundFileFormat where
    cast i =
        MkSFFormat
        (cast $ prim__and_Int i maskHeader)
        (cast $ prim__and_Int i maskEncoding)
        (cast $ prim__and_Int i maskEndian)

record SoundFileInfo where
    constructor MkSFInfo
    frames : SoundFileCount
    samplerate : Int
    channels : Int
    format : SoundFileFormat
    sections : Int
    seekable : Bool

setSFInfo : SoundFileInfoStruct -> SoundFileInfo -> IO ()
setSFInfo struct info = do
    setField struct "frames"        (frames info)
    setField struct "samplerate"    (samplerate info)
    setField struct "channels"      (channels info)
    setField struct "format"        (the Int $ cast $ format info)
    setField struct "sections"      (sections info)
    setField struct "seekable"      (the Int $ cast $ seekable info)

getSFInfo : SoundFileInfoStruct -> SoundFileInfo
getSFInfo struct =
    let
        fr : SoundFileCount = getField struct "frames"
        sr : Int            = getField struct "samplerate"
        ch : Int            = getField struct "channels"
        fm : Int            = getField struct "format"
        sc : Int            = getField struct "sections"
        sk : Int            = getField struct "seekable"
    in
    MkSFInfo fr sr ch (cast fm) sc (cast sk)

Managed SoundFileInfoStruct where
    alloc = ?allocSFInfo
    annul = ?annulSFInfo
    -- TODO: memory management on c side

record SoundFile where
    constructor MkSoundFile
    path : Path
    mode : SoundFileAccessMode
    info : SoundFileInfo
    ptr  : SoundFilePtr

---- Functions

sf_open : Path -> SoundFileAccessMode -> SoundFileInfoStruct -> IO SoundFile
sf_open p m i =
    do
        sfptr <- primIO $ prim_sf_open (show p) (the Int $ cast m) i
        pure (MkSoundFile p m (getSFInfo i) sfptr)

sf_error : SoundFile -> IO SoundFileLibError
sf_error (MkSoundFile _ _ _ ptr) = do
    err <- primIO $ prim_sf_error ptr
    pure (cast err)

export
sf_version_string : IO String
sf_version_string = do
    ver <- primIO $ prim_sf_version_string
    pure ver

sf_close : SoundFile -> IO SoundFileLibError
sf_close sf = do
    err <- primIO $ prim_sf_close (ptr sf)
    pure (cast err)

private
sf_manage_with_info : {out : Type}
         -> SoundFileAccessMode
         -> SoundFileInfo
         -> Path
         -> (work : SoundFile -> IO out)
         -> (handle_error_opening : SoundFileError -> IO out)
         -> (handle_error_closing : SoundFileError -> IO out)
         -> IO out
sf_manage_with_info mode info path work handle_err_open handle_err_close =
    manage (\infostruct => do
            setSFInfo infostruct info
            sf <- sf_open path Write infostruct
            errno_open <- sf_error sf
            if errno_open /= SoundFileLibErrorNone
             then handle_err_open (SoundFileErrorLibrary errno_open)
             else do
                result <- work sf
                errno_close <- sf_close sf
                if errno_close /= SoundFileLibErrorNone
                 then handle_err_close (SoundFileErrorLibrary errno_close)
                 else pure result
    )

private
nullInfo : SoundFileInfo
nullInfo = MkSFInfo 0 0 0 (cast $ the Int 0) 0 (cast $ the Int 0)

export
sf_manage : {out : Type}
         -> (mode : SoundFileAccessMode)
         -> (if mode == Write then SoundFileInfo else ())
         -> Path
         -> (work : SoundFile -> IO out)
         -> (handle_error_opening : SoundFileError -> IO out)
         -> (handle_error_closing : SoundFileError -> IO out)
         -> IO out
sf_manage Write     info    = sf_manage_with_info Write      info
sf_manage Read      ()      = sf_manage_with_info Read       nullInfo
sf_manage ReadWrite ()      = sf_manage_with_info ReadWrite  nullInfo

-- TODO: Error capture and handling
