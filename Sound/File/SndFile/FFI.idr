module Sound.File.SndFile.FFI
import Sound.File.SndFile.ForeignEnums
import Sound.File.SndFile.ForeignTypes
import Sound.File.SndFile.Bindings
import Memory.Management
import System.Path
import System.FFI

Cast Bool Int where
    cast True = 0
    cast False = 1

Cast Int Bool where
    cast = intToBool

-- Wraps around Bindings, ForeignEnums and ForeignTypes
-- to provide a function interface to libsndfile.

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

-- ...

sf_close : SoundFile -> IO ()
sf_close sf = do
    primIO $ prim_sf_close (ptr sf)
    pure ()

-- caseModeOf : {out : Type} -> (mode : SoundFileAccessMode) -> Type
-- caseModeOf Write  = SoundFileInfo -> (SoundFile -> IO out) -> IO out
-- caseModeOf _      = (SoundFile -> IO out) -> IO out

private
sf_manage_with_info : {out : Type}
         -> SoundFileAccessMode
         -> SoundFileInfo
         -> Path
         -> (SoundFile -> IO out)
         -> IO out
sf_manage_with_info mode info path work = do
    result <- manage (\infostruct => do
            setSFInfo infostruct info
            sf <- sf_open path Write infostruct
            result <- work sf
            sf_close sf
            pure result
        )
    pure result

sf_manage : {out : Type}
         -> (mode : SoundFileAccessMode)
         -> (if mode == Write then SoundFileInfo else ())
         -> Path
         -> (SoundFile -> IO out)
         -> IO out
sf_manage Write     info    = sf_manage_with_info Write      info
sf_manage Read      ()      = sf_manage_with_info Read       (MkSFInfo 0 0 0 (cast $ the Int 0) 0 (cast $ the Int 0))
sf_manage ReadWrite ()      = sf_manage_with_info ReadWrite  (MkSFInfo 0 0 0 (cast $ the Int 0) 0 (cast $ the Int 0))

-- test : IO ()
-- test = do
--         sf_manage ?p Read (\sf => pure ())
--         pure ()
