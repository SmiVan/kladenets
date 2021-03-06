module Sound.File.SndFile.Bindings
import Sound.File.SndFile.ForeignTypes
import Sound.File.SndFile.ForeignEnums

libsndfile : String -> String
libsndfile x = "C:" ++ x ++ ",libsndfile"

-- Raw FFI bindings for libsndfile
-- This file has to be checked against libsndfile/include/sndfile.h.in

---- GENERAL FUNCTIONS

%foreign libsndfile "sf_open"
export
prim_sf_open : (path : String) -> (mode : Int) -> SoundFileInfoStruct -> PrimIO SoundFilePtr

%foreign libsndfile "sf_open_fd"
export
prim_sf_open_fd : (file_descriptor : Int) -> (mode : Int) -> SoundFileInfoStruct -> (close_descriptor_bool : Int) -> PrimIO SoundFilePtr
-- TODO: Handle bool

-- %foreign libsndfile "sf_open_virtual"
-- export
-- prim_sf_open_virtual : SoundFileVirtualIO -> (mode : Int) -> SoundFileInfo -> (user_data : AnyPtr) -> PrimIO SoundFilePtr
-- TODO: Waiting for VirtualIO

%foreign libsndfile "sf_error"
export
prim_sf_error : SoundFilePtr -> PrimIO Int -- err num

%foreign libsndfile "sf_strerror"
export
prim_sf_strerror : SoundFilePtr -> PrimIO String

%foreign libsndfile "sf_error_number"
export
prim_sf_error_number : (errornumber : Int) -> PrimIO String

-- /!\: sf_perror is deprecated

-- /!\: sf_error_str is deprecated

%foreign libsndfile "sf_command"
export
prim_sf_command : SoundFilePtr -> (command : Int) -> (data_ptr : AnyPtr) -> (datasize : Int) -> PrimIO Int

%foreign libsndfile "sf_format_check"
export
prim_sf_format_check : SoundFileInfoStruct -> PrimIO Int -- Bool
-- TODO: Handle bool

%foreign libsndfile "sf_seek"
export
prim_sf_seek : SoundFilePtr -> (frames : SoundFileCount) -> (whence : Int) -> PrimIO SoundFileCount

%foreign libsndfile "sf_set_string"
export
prim_sf_set_string : SoundFilePtr -> (str_type : Int) -> String -> PrimIO Int

%foreign libsndfile "sf_get_string"
export
prim_sf_get_string : SoundFilePtr -> (str_type : Int) -> PrimIO String

%foreign libsndfile "sf_version_string"
export
prim_sf_version_string : PrimIO String

%foreign libsndfile "sf_current_byterate"
export
prim_sf_current_byterate : SoundFilePtr -> PrimIO Int

%foreign libsndfile "sf_read_raw"
export
prim_sf_read_raw : SoundFilePtr -> (ptr : AnyPtr) -> (bytes : SoundFileCount) -> PrimIO SoundFileCount

%foreign libsndfile "sf_write_raw"
export
prim_sf_write_raw : SoundFilePtr -> (ptr : AnyPtr) -> (bytes : SoundFileCount) -> PrimIO SoundFileCount

-- /!\: sf_readf_short is not supported in Idris2.

-- /!\: sf_writef_short is not supported in Idris2.

-- TODO: Consider implementing bit size detection to map Short to BitsX?

%foreign libsndfile "sf_readf_int"
export
prim_sf_readf_int : SoundFilePtr -> (int_ptr : AnyPtr) -> (frames : SoundFileCount) -> PrimIO SoundFileCount

%foreign libsndfile "sf_writef_int"
export
prim_sf_writef_int : SoundFilePtr -> (int_ptr : AnyPtr) -> (frames : SoundFileCount) -> PrimIO SoundFileCount

-- /!\: sf_readf_float is not supported in Idris2.

-- /!\: sf_writef_float is not supported in Idris2.

%foreign libsndfile "sf_readf_double"
export
prim_sf_readf_double : SoundFilePtr -> (double_ptr : AnyPtr) -> (frames : SoundFileCount) -> PrimIO SoundFileCount

%foreign libsndfile "sf_writef_double"
export
prim_sf_writef_double : SoundFilePtr -> (double_ptr : AnyPtr) -> (frames : SoundFileCount) -> PrimIO SoundFileCount

-- /!\: sf_read_short is not supported in Idris2.

-- /!\: sf_write_short is not supported in Idris2.

-- TODO: Consider implementing bit size detection to map Short to BitsX?

%foreign libsndfile "sf_read_int"
export
prim_sf_read_int : SoundFilePtr -> (int_ptr : AnyPtr) -> (items : SoundFileCount) -> PrimIO SoundFileCount

%foreign libsndfile "sf_write_int"
export
prim_sf_write_int : SoundFilePtr -> (int_ptr : AnyPtr) -> (items : SoundFileCount) -> PrimIO SoundFileCount

-- /!\: sf_read_float is not supported in Idris2.

-- /!\: sf_write_float is not supported in Idris2.

%foreign libsndfile "sf_read_double"
export
prim_sf_read_double : SoundFilePtr -> (double_ptr : AnyPtr) -> (items : SoundFileCount) -> PrimIO SoundFileCount

%foreign libsndfile "sf_write_double"
export
prim_sf_write_double : SoundFilePtr -> (double_ptr : AnyPtr) -> (items : SoundFileCount) -> PrimIO SoundFileCount

%foreign libsndfile "sf_close"
export
prim_sf_close : SoundFilePtr -> PrimIO Int -- error num

%foreign libsndfile "sf_write_sync"
export
prim_sf_write_sync : SoundFilePtr -> PrimIO ()

-- /!\: sf_wchar_open is not supported, as it is Windows only.

-- TODO: SF_CHUNK_INFO and associated functions (:773)
