module Sound.File.SndFile.ForeignTypes
import System.FFI

-- Raw FFI bindings for libsndfile
-- This file has to be checked against libsndfile/include/sndfile.h.in

---- TYPES

public export
SoundFilePtr : Type
SoundFilePtr = AnyPtr

public export
SoundFileCount : Type
SoundFileCount = Bits64 -- Provisional
-- TODO: SF_COUNT type changes depending on compile-time conditions.
--       Low priority, since in practice this is always set to Bits64.


---- STRUCTS

public export
SoundFileInfoStruct : Type
SoundFileInfoStruct = Struct "SF_INFO" [
    ("frames", SoundFileCount),
    ("samplerate", Int),
    ("channels", Int),
    ("format", Int),
    ("sections", Int),
    ("seekable", Int)
]

public export
SoundFileFormatInfoStruct : Type
SoundFileFormatInfoStruct = Struct "SF_FORMAT_INFO" [
    ("format", Int),
    ("name", String),
    ("extension", String)
]

public export
SoundFileDitherInfoStruct : Type
SoundFileDitherInfoStruct = Struct "SF_DITHER_INFO" [
    ("type", Int),
    ("level", Double),
    ("name", String)
]

public export
SoundFileEmbedFileInfoStruct : Type
SoundFileEmbedFileInfoStruct = Struct "SF_EMBED_FILE_INFO" [
    ("offset", SoundFileCount),
    ("length", SoundFileCount)
]

public export
SoundFileCuePointStruct : Type
SoundFileCuePointStruct = ?sf_cue_point
-- TODO: How to handle 'char name [256]' array?

public export
SoundFileInstrumentStruct : Type
SoundFileInstrumentStruct = ?sf_instrument
-- TODO: How to handle embed loops struct?

public export
SoundFileLoopInfoStruct : Type
SoundFileLoopInfoStruct = ?sf_loop_info
-- TODO: How to handle 'int future [6]' array?

public export
SoundFileBroadcastInfoStruct : Type
SoundFileBroadcastInfoStruct = ?sf_broadcast_info
-- TODO: How to handle arrays and macro definition?

public export
SoundFileCartTimerStruct : Type
SoundFileCartTimerStruct = ?sf_cart_timer
-- TODO: How to handle 'char usage [4]' array?

public export
SoundFileCartInfoStruct : Type
SoundFileCartInfoStruct = ?sf_cart_info
-- TODO: How to handle arrays, embed structs and macro definition?

---- VIRTUAL IO

-- TODO: Figure out what these actually do.
SoundFileVirtualIO_GetFileLength : Type
SoundFileVirtualIO_GetFileLength = AnyPtr -> SoundFileCount

SoundFileVirtualIO_Seek : Type
SoundFileVirtualIO_Seek = SoundFileCount -> (whence : Int) -> AnyPtr -> SoundFileCount

SoundFileVirtualIO_Read : Type
SoundFileVirtualIO_Read = AnyPtr -> SoundFileCount -> AnyPtr -> SoundFileCount

SoundFileVirtualIO_Write : Type
SoundFileVirtualIO_Write = AnyPtr -> SoundFileCount -> AnyPtr -> SoundFileCount

SoundFileVirtualIO_Tell : Type
SoundFileVirtualIO_Tell = AnyPtr -> SoundFileCount

SoundFileVirtualIOStruct : Type
SoundFileVirtualIOStruct = ?sf_virtual_io
-- TODO: How to handle struct containing functions?
--       Verify functionality in Boilerworks.
