module Sound.File.SndFile.FFI
import Sound.File.SndFile.ForeignEnums
import Sound.File.SndFile.ForeignTypes
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


---- Functions

-- sf_open : Path -> Mode -> SoundFileInfo -> SoundFile
