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

public export
SoundFileError : Type
SoundFileError = Int

---- STRUCTS

public export
SoundFileInfo : Type
SoundFileInfo = Struct "SF_INFO" [
    ("frames", SoundFileCount),
    ("samplerate", Int),
    ("channels", Int),
    ("format", Int),
    ("sections", Int),
    ("seekable", Int)
]

public export
SoundFileFormatInfo : Type
SoundFileFormatInfo = Struct "SF_FORMAT_INFO" [
    ("format", Int),
    ("name", String),
    ("extension", String)
]

public export
SoundFileDitherInfo : Type
SoundFileDitherInfo = Struct "SF_DITHER_INFO" [
    ("type", Int),
    ("level", Double),
    ("name", String)
]

public export
SoundFileEmbedFileInfo : Type
SoundFileEmbedFileInfo = Struct "SF_EMBED_FILE_INFO" [
    ("offset", SoundFileCount),
    ("length", SoundFileCount)
]

public export
SoundFileCuePoint : Type
SoundFileCuePoint = ?sf_cue_point
-- TODO: How to handle 'char name [256]' array?

public export
SoundFileInstrument : Type
SoundFileInstrument = ?sf_instrument
-- TODO: How to handle embed loops struct?

public export
SoundFileLoopInfo : Type
SoundFileLoopInfo = ?sf_loop_info
-- TODO: How to handle 'int future [6]' array?

public export
SoundFileBroadcastInfo : Type
SoundFileBroadcastInfo = ?sf_broadcast_info
-- TODO: How to handle arrays and macro definition?

public export
SoundFileCartTimer : Type
SoundFileCartTimer = ?sf_cart_timer
-- TODO: How to handle 'char usage [4]' array?

public export
SoundFileCartInfo : Type
SoundFileCartInfo = ?sf_cart_info
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

SoundFileVirtualIO : Type
SoundFileVirtualIO = ?sf_virtual_io
-- TODO: How to handle struct containing functions?
--       Verify functionality in Boilerworks.
