module Sound.File.SndFile.FFI
import Utils.Path

-- Wraps around Bindings, ForeignEnums and ForeignTypes
-- to provide a function interface to libsndfile.

-- sf_open : Path -> Mode -> SoundFileInfo -> SoundFile
