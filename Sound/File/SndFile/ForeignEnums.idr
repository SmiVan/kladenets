module Sound.File.SndFile.ForeignEnums

-- Based on the C Enums from libsndfile/include/sndfile.h.in
-- INVALID constructors are the enum overflow case.

---- SOUND FILE FORMAT HEADER FORMAT

data SoundFileHeaderFormat =
    NO_HEADER |
    ||| Microsoft WAV format (little endian).
    WAV |
    ||| Apple/SGI AIFF format (big endian).
    AIFF |
    ||| Sun/NeXT AU format (big endian).
    AU |
    ||| RAW PCM data.
    RAW |
    ||| Ensoniq PARIS file format.
    PAF |
    ||| Amiga IFF / SVX8 / SV16 format.
    SVX |
    ||| Sphere NIST format.
    NIST |
    ||| VOC files.
    VOC |
    ||| Berkeley/IRCAM/CARL
    IRCAM |
    ||| Sonic Foundry's 64 bit RIFF/WAV
    W64 |
    ||| Matlab (tm) V4.2 / GNU Octave 2.0
    MAT4 |
    ||| Matlab (tm) V5.0 / GNU Octave 2.1
    MAT5 |
    ||| Portable Voice Format
    PVF |
    ||| Fasttracker 2 Extended Instrument
    XI |
    ||| HMM Tool Kit format
    HTK |
    ||| Midi Sample Dump Standard
    SDS |
    ||| Audio Visual Research
    AVR |
    ||| MS WAVE with WAVEFORMATEX
    WAVEX |
    ||| Sound Designer 2
    SD2 |
    ||| FLAC lossless file format
    FLAC |
    ||| Core Audio File format
    CAF |
    ||| Psion WVE format
    WVE |
    ||| Xiph OGG container
    OGG |
    ||| Akai MPC 2000 sampler
    MPC2K |
    ||| RF64 WAV file
    RF64 |
    BAD_HEADER

Eq SoundFileHeaderFormat where
    NO_HEADER == NO_HEADER = True
    WAV == WAV = True
    AIFF == AIFF = True
    AU == AU = True
    RAW == RAW = True
    PAF == PAF = True
    SVX == SVX = True
    NIST == NIST = True
    VOC == VOC = True
    IRCAM == IRCAM = True
    W64 == W64 = True
    MAT4 == MAT4 = True
    MAT5 == MAT5 = True
    PVF == PVF = True
    XI == XI = True
    HTK == HTK = True
    SDS == SDS = True
    AVR == AVR = True
    WAVEX == WAVEX = True
    SD2 == SD2 = True
    FLAC == FLAC = True
    CAF == CAF = True
    WVE == WVE = True
    OGG == OGG = True
    MPC2K == MPC2K = True
    RF64 == RF64 = True
    BAD_HEADER == BAD_HEADER = True
    _ == _ = False

Cast SoundFileHeaderFormat Int where
    cast NO_HEADER  = 0x00000000
    cast WAV        = 0x00010000
    cast AIFF       = 0x00020000
    cast AU         = 0x00030000
    cast RAW        = 0x00040000
    cast PAF        = 0x00050000
    cast SVX        = 0x00060000
    cast NIST       = 0x00070000
    cast VOC        = 0x00080000
    cast IRCAM      = 0x000A0000
    cast W64        = 0x000B0000
    cast MAT4       = 0x000C0000
    cast MAT5       = 0x000D0000
    cast PVF        = 0x000E0000
    cast XI         = 0x000F0000
    cast HTK        = 0x00100000
    cast SDS        = 0x00110000
    cast AVR        = 0x00120000
    cast WAVEX      = 0x00130000
    cast SD2        = 0x00160000
    cast FLAC       = 0x00170000
    cast CAF        = 0x00180000
    cast WVE        = 0x00190000
    cast OGG        = 0x00200000
    cast MPC2K      = 0x00210000
    cast RF64       = 0x00220000
    cast BAD_HEADER = 0x0FFF0000

Cast Int SoundFileHeaderFormat where
    cast 0x00000000 = NO_HEADER
    cast 0x00010000 = WAV
    cast 0x00020000 = AIFF
    cast 0x00030000 = AU
    cast 0x00040000 = RAW
    cast 0x00050000 = PAF
    cast 0x00060000 = SVX
    cast 0x00070000 = NIST
    cast 0x00080000 = VOC
    cast 0x000A0000 = IRCAM
    cast 0x000B0000 = W64
    cast 0x000C0000 = MAT4
    cast 0x000D0000 = MAT5
    cast 0x000E0000 = PVF
    cast 0x000F0000 = XI
    cast 0x00100000 = HTK
    cast 0x00110000 = SDS
    cast 0x00120000 = AVR
    cast 0x00130000 = WAVEX
    cast 0x00160000 = SD2
    cast 0x00170000 = FLAC
    cast 0x00180000 = CAF
    cast 0x00190000 = WVE
    cast 0x00200000 = OGG
    cast 0x00210000 = MPC2K
    cast 0x00220000 = RF64
    cast _          = BAD_HEADER

Show SoundFileHeaderFormat where
    show NO_HEADER  = "None"
    show WAV        = "Microsoft WAV format (little endian)."
    show AIFF       = "Apple/SGI AIFF format (big endian)."
    show AU         = "Sun/NeXT AU format (big endian)."
    show RAW        = "RAW PCM data."
    show PAF        = "Ensoniq PARIS file format."
    show SVX        = "Amiga IFF / SVX8 / SV16 format."
    show NIST       = "Sphere NIST format."
    show VOC        = "VOC files."
    show IRCAM      = "Berkeley/IRCAM/CARL"
    show W64        = "Sonic Foundry's 64 bit RIFF/WAV"
    show MAT4       = "Matlab (tm) V4.2 / GNU Octave 2.0"
    show MAT5       = "Matlab (tm) V5.0 / GNU Octave 2.1"
    show PVF        = "Portable Voice Format"
    show XI         = "Fasttracker 2 Extended Instrument"
    show HTK        = "HMM Tool Kit format"
    show SDS        = "Midi Sample Dump Standard"
    show AVR        = "Audio Visual Research"
    show WAVEX      = "MS WAVE with WAVEFORMATEX"
    show SD2        = "Sound Designer 2"
    show FLAC       = "FLAC lossless file format"
    show CAF        = "Core Audio File format"
    show WVE        = "Psion WVE format"
    show OGG        = "Xiph OGG container"
    show MPC2K      = "Akai MPC 2000 sampler"
    show RF64       = "RF64 WAV file"
    show BAD_HEADER = "INVALID HEADER FORMAT"

---- SOUND FILE FORMAT SAMPLE ENCODING

data SoundFileSampleEncoding =
    NO_ENCODING |
    ||| Signed 8 bit data
    PCM_S8 |
    ||| Signed 16 bit data
    PCM_16 |
    ||| Signed 24 bit data
    PCM_24 |
    ||| Signed 32 bit data
    PCM_32 |
    ||| Unsigned 8 bit data (WAV and RAW only)
    PCM_U8 |
    ||| 32 bit float data
    FLOAT |
    ||| 64 bit float data
    DOUBLE |
    ||| U-Law encoded.
    ULAW |
    ||| A-Law encoded.
    ALAW |
    ||| IMA ADPCM.
    IMA_ADPCM |
    ||| Microsoft ADPCM.
    MS_ADPCM |
    ||| GSM 6.10 encoding.
    GSM610 |
    ||| Oki Dialogic ADPCM encoding.
    VOX_ADPCM |
    ||| 32kbs G721 ADPCM encoding.
    G721_32 |
    ||| 24kbs G723 ADPCM encoding.
    G723_24 |
    ||| 40kbs G723 ADPCM encoding.
    G723_40 |
    ||| 12 bit Delta Width Variable Word encoding.
    DWVW_12 |
    ||| 16 bit Delta Width Variable Word encoding.
    DWVW_16 |
    ||| 24 bit Delta Width Variable Word encoding.
    DWVW_24 |
    ||| N bit Delta Width Variable Word encoding.
    DWVW_N |
    ||| 8 bit differential PCM (XI only)
    DPCM_8 |
    ||| 16 bit differential PCM (XI only)
    DPCM_16 |
    ||| Xiph Vorbis encoding.
    VORBIS |
    BAD_ENCODING

Eq SoundFileSampleEncoding where
    NO_ENCODING == NO_ENCODING = True
    PCM_S8 == PCM_S8 = True
    PCM_16 == PCM_16 = True
    PCM_24 == PCM_24 = True
    PCM_32 == PCM_32 = True
    PCM_U8 == PCM_U8 = True
    FLOAT == FLOAT = True
    DOUBLE == DOUBLE = True
    ULAW == ULAW = True
    ALAW == ALAW = True
    IMA_ADPCM == IMA_ADPCM = True
    MS_ADPCM == MS_ADPCM = True
    GSM610 == GSM610 = True
    VOX_ADPCM == VOX_ADPCM = True
    G721_32 == G721_32 = True
    G723_24 == G723_24 = True
    G723_40 == G723_40 = True
    DWVW_12 == DWVW_12 = True
    DWVW_16 == DWVW_16 = True
    DWVW_24 == DWVW_24 = True
    DWVW_N == DWVW_N = True
    DPCM_8 == DPCM_8 = True
    DPCM_16 == DPCM_16 = True
    VORBIS == VORBIS = True
    BAD_ENCODING == BAD_ENCODING = True
    _ == _ = False

Cast SoundFileSampleEncoding Int where
    cast NO_ENCODING    = 0x00000000
    cast PCM_S8         = 0x00000001
    cast PCM_16         = 0x00000002
    cast PCM_24         = 0x00000003
    cast PCM_32         = 0x00000004
    cast PCM_U8         = 0x00000005
    cast FLOAT          = 0x00000006
    cast DOUBLE         = 0x00000007
    cast ULAW           = 0x00000010
    cast ALAW           = 0x00000011
    cast IMA_ADPCM      = 0x00000012
    cast MS_ADPCM       = 0x00000013
    cast GSM610         = 0x00000020
    cast VOX_ADPCM      = 0x00000021
    cast G721_32        = 0x00000030
    cast G723_24        = 0x00000031
    cast G723_40        = 0x00000032
    cast DWVW_12        = 0x00000040
    cast DWVW_16        = 0x00000041
    cast DWVW_24        = 0x00000042
    cast DWVW_N         = 0x00000043
    cast DPCM_8         = 0x00000050
    cast DPCM_16        = 0x00000051
    cast VORBIS         = 0x00000060
    cast BAD_ENCODING   = 0x0000FFFF

Cast Int SoundFileSampleEncoding where
    cast 0x00000000 = NO_ENCODING
    cast 0x00000001 = PCM_S8
    cast 0x00000002 = PCM_16
    cast 0x00000003 = PCM_24
    cast 0x00000004 = PCM_32
    cast 0x00000005 = PCM_U8
    cast 0x00000006 = FLOAT
    cast 0x00000007 = DOUBLE
    cast 0x00000010 = ULAW
    cast 0x00000011 = ALAW
    cast 0x00000012 = IMA_ADPCM
    cast 0x00000013 = MS_ADPCM
    cast 0x00000020 = GSM610
    cast 0x00000021 = VOX_ADPCM
    cast 0x00000030 = G721_32
    cast 0x00000031 = G723_24
    cast 0x00000032 = G723_40
    cast 0x00000040 = DWVW_12
    cast 0x00000041 = DWVW_16
    cast 0x00000042 = DWVW_24
    cast 0x00000043 = DWVW_N
    cast 0x00000050 = DPCM_8
    cast 0x00000051 = DPCM_16
    cast 0x00000060 = VORBIS
    cast _          = BAD_ENCODING

Show SoundFileSampleEncoding where
    show NO_ENCODING    = "None"
    show PCM_S8         = "Signed 8 bit data"
    show PCM_16         = "Signed 16 bit data"
    show PCM_24         = "Signed 24 bit data"
    show PCM_32         = "Signed 32 bit data"
    show PCM_U8         = "Unsigned 8 bit data (WAV and RAW only)"
    show FLOAT          = "32 bit float data"
    show DOUBLE         = "64 bit float data"
    show ULAW           = "U-Law encoded."
    show ALAW           = "A-Law encoded."
    show IMA_ADPCM      = "IMA ADPCM."
    show MS_ADPCM       = "Microsoft ADPCM."
    show GSM610         = "GSM 6.10 encoding."
    show VOX_ADPCM      = "Oki Dialogic ADPCM encoding."
    show G721_32        = "32kbs G721 ADPCM encoding."
    show G723_24        = "24kbs G723 ADPCM encoding."
    show G723_40        = "40kbs G723 ADPCM encoding."
    show DWVW_12        = "12 bit Delta Width Variable Word encoding."
    show DWVW_16        = "16 bit Delta Width Variable Word encoding."
    show DWVW_24        = "24 bit Delta Width Variable Word encoding."
    show DWVW_N         = "N bit Delta Width Variable Word encoding."
    show DPCM_8         = "8 bit differential PCM (XI only)"
    show DPCM_16        = "16 bit differential PCM (XI only)"
    show VORBIS         = "Xiph Vorbis encoding."
    show BAD_ENCODING   = "INVALID SAMPLE ENCODING"

---- SOUND FILE FORMAT ENDIANNESS

data SoundFileEndian =
    ||| Default file endian-ness.
    FileEndian |
    ||| Force little endian-ness.
    LittleEndian |
    ||| Force big endian-ness.
    BigEndian |
    ||| Force CPU endian-ness.
    CPUEndian |
    BAD_ENDIAN

Eq SoundFileEndian where
    FileEndian == FileEndian = True
    LittleEndian == LittleEndian = True
    BigEndian == BigEndian = True
    CPUEndian == CPUEndian = True
    BAD_ENDIAN == BAD_ENDIAN = True
    _ == _ = False

Cast SoundFileEndian Int where
    cast FileEndian     = 0x00000000
    cast LittleEndian   = 0x10000000
    cast BigEndian      = 0x20000000
    cast CPUEndian      = 0x30000000
    cast BAD_ENDIAN     = 0xF0000000

Cast Int SoundFileEndian where
    cast 0x00000000     = FileEndian
    cast 0x10000000     = LittleEndian
    cast 0x20000000     = BigEndian
    cast 0x30000000     = CPUEndian
    cast _              = BAD_ENDIAN

Show SoundFileEndian where
    show FileEndian    = "Default file endian-ness"
    show LittleEndian  = "Little endian-ness."
    show BigEndian     = "Big endian-ness."
    show CPUEndian     = "CPU endian-ness."
    show BAD_ENDIAN    = "INVALID ENDIANNESS"

---- SOUND FILE LIBRARY COMMANDS

-- Documentation mostly from http://libsndfile.github.io/libsndfile/command.html

data SoundFileLibraryCommand  =
    ||| Retrieve the version of the library as a string.
    GET_LIB_VERSION             |
    ||| Retrieve the internal per-file operation log.
    GET_LOG_INFO                |
    ||| Retrieve SF_INFO struct of opened file.
    GET_CURRENT_SF_INFO         |
    ||| Get double normalisation behaviour.
    GET_NORM_DOUBLE             |
    ||| Get float normalisation behaviour.
    GET_NORM_FLOAT              |
    ||| Set double normalisation behaviour.
    SET_NORM_DOUBLE             |
    ||| Set float normalisation behaviour.
    SET_NORM_FLOAT              |
    ||| Control scale factor on read.
    SET_SCALE_FLOAT_INT_READ    |
    ||| Control scale factor on write.
    SET_SCALE_INT_FLOAT_WRITE   |
    ||| Get simple formats count.
    GET_SIMPLE_FORMAT_COUNT     |
    ||| Get information about a simple format.
    GET_SIMPLE_FORMAT           |
    ||| Get information about a major or subtype format.
    GET_FORMAT_INFO             |
    ||| Get the number of major formats.
    GET_FORMAT_MAJOR_COUNT      |
    ||| Get information about a major format type.
    GET_FORMAT_MAJOR            |
    ||| Get the number of subformats.
    GET_FORMAT_SUBTYPE_COUNT    |
    ||| Get information about a subformat.
    GET_FORMAT_SUBTYPE          |
    ||| Calculate the measured maximum signal value.
    CALC_SIGNAL_MAX             |
    ||| Calculate the measured normalised maximum signal value.
    CALC_NORM_SIGNAL_MAX        |
    ||| Calculate the peak value for each channel.
    CALC_MAX_ALL_CHANNELS       |
    ||| Calculate the normalised peak for each channel.
    CALC_NORM_MAX_ALL_CHANNELS  |
    ||| Retrieve the peak value for the file.
    GET_SIGNAL_MAX              |
    ||| Retrieve the peak value for each channel.
    GET_MAX_ALL_CHANNELS        |
    ||| Control PEAK chunk write to WAV and AIFF.
    SET_ADD_PEAK_CHUNK          |
    ||| Update the file header in write mode on demand.
    UPDATE_HEADER_NOW           |
    ||| Update the file header on each write.
    SET_UPDATE_HEADER_AUTO      |
    ||| Truncate a file open for write or for read/write.
    FILE_TRUNCATE               |
    ||| Change the data start offset for raw files.
    SET_RAW_START_OFFSET        |
    ||| TODO: Missing documentation.
    SET_DITHER_ON_WRITE         |
    ||| TODO: Missing documentation.
    SET_DITHER_ON_READ          |
    ||| TODO: Missing documentation.
    GET_DITHER_INFO_COUNT       |
    ||| TODO: Missing documentation.
    GET_DITHER_INFO             |
    ||| Get information about embedded audio files.
    GET_EMBED_FILE_INFO         |
    ||| Control automatic clipping behaviour.
    SET_CLIPPING                |
    ||| Get current clipping setting.
    GET_CLIPPING                |
    ||| Get the cue marker count.
    GET_CUE_COUNT               |
    ||| Get cue marker info.
    GET_CUE                     |
    ||| Set cue marker info.
    SET_CUE                     |
    ||| Get instrument info.
    GET_INSTRUMENT              |
    ||| Set instrument info.
    SET_INSTRUMENT              |
    ||| Get loop info.
    GET_LOOP_INFO               |
    ||| Get the Broadcast Chunk info.
    GET_BROADCAST_INFO          |
    ||| Set the Broadcast Chunk info.
    SET_BROADCAST_INFO          |
    ||| Get the channel map info.
    GET_CHANNEL_MAP_INFO        |
    ||| Set the channel map info.
    SET_CHANNEL_MAP_INFO        |
    ||| Determine if raw data needs endswapping.
    RAW_DATA_NEEDS_ENDSWAP      |
    ||| Modify a WAVEX header for Ambisonic format.
    WAVEX_SET_AMBISONIC         |
    ||| Test a WAVEX file for Ambisonic format.
    WAVEX_GET_AMBISONIC         |
    ||| RF64 files can be set so that on-close, writable files that have
    ||| less than 4GB of data in them are converted to RIFF/WAV, as per EBU
    ||| recommendations.
    RF64_AUTO_DOWNGRADE         |
    ||| Set the Variable Bit Rate encoding quality.
    SET_VBR_ENCODING_QUALITY    |
    ||| Set the compression level.
    SET_COMPRESSION_LEVEL       |
    ||| Set Ogg page latency for Opus file.
    SET_OGG_PAGE_LATENCY_MS     |
    ||| Set Ogg page latency for Opus file.
    SET_OGG_PAGE_LATENCY        |
    ||| Set the Cart Chunk info.
    SET_CART_INFO               |
    ||| Get the Cart Chunk info.
    GET_CART_INFO               |
    ||| Set original samplerate metadata.
    SET_ORIGINAL_SAMPLERATE     |
    ||| Get original samplerate metadata.
    GET_ORIGINAL_SAMPLERATE

-- Commands only need to have an outgoing enumeration.

Cast SoundFileLibraryCommand Int where
    cast GET_LIB_VERSION            = 0x1000
    cast GET_LOG_INFO               = 0x1001
    cast GET_CURRENT_SF_INFO        = 0x1002
    cast GET_NORM_DOUBLE            = 0x1010
    cast GET_NORM_FLOAT             = 0x1011
    cast SET_NORM_DOUBLE            = 0x1012
    cast SET_NORM_FLOAT             = 0x1013
    cast SET_SCALE_FLOAT_INT_READ   = 0x1014
    cast SET_SCALE_INT_FLOAT_WRITE  = 0x1015
    cast GET_SIMPLE_FORMAT_COUNT    = 0x1020
    cast GET_SIMPLE_FORMAT          = 0x1021
    cast GET_FORMAT_INFO            = 0x1028
    cast GET_FORMAT_MAJOR_COUNT     = 0x1030
    cast GET_FORMAT_MAJOR           = 0x1031
    cast GET_FORMAT_SUBTYPE_COUNT   = 0x1032
    cast GET_FORMAT_SUBTYPE         = 0x1033
    cast CALC_SIGNAL_MAX            = 0x1040
    cast CALC_NORM_SIGNAL_MAX       = 0x1041
    cast CALC_MAX_ALL_CHANNELS      = 0x1042
    cast CALC_NORM_MAX_ALL_CHANNELS = 0x1043
    cast GET_SIGNAL_MAX             = 0x1044
    cast GET_MAX_ALL_CHANNELS       = 0x1045
    cast SET_ADD_PEAK_CHUNK         = 0x1050
    cast UPDATE_HEADER_NOW          = 0x1060
    cast SET_UPDATE_HEADER_AUTO     = 0x1061
    cast FILE_TRUNCATE              = 0x1080
    cast SET_RAW_START_OFFSET       = 0x1090
    cast SET_DITHER_ON_WRITE        = 0x10A0
    cast SET_DITHER_ON_READ         = 0x10A1
    cast GET_DITHER_INFO_COUNT      = 0x10A2
    cast GET_DITHER_INFO            = 0x10A3
    cast GET_EMBED_FILE_INFO        = 0x10B0
    cast SET_CLIPPING               = 0x10C0
    cast GET_CLIPPING               = 0x10C1
    cast GET_CUE_COUNT              = 0x10CD
    cast GET_CUE                    = 0x10CE
    cast SET_CUE                    = 0x10CF
    cast GET_INSTRUMENT             = 0x10D0
    cast SET_INSTRUMENT             = 0x10D1
    cast GET_LOOP_INFO              = 0x10E0
    cast GET_BROADCAST_INFO         = 0x10F0
    cast SET_BROADCAST_INFO         = 0x10F1
    cast GET_CHANNEL_MAP_INFO       = 0x1100
    cast SET_CHANNEL_MAP_INFO       = 0x1101
    cast RAW_DATA_NEEDS_ENDSWAP     = 0x1110
    cast WAVEX_SET_AMBISONIC        = 0x1200
    cast WAVEX_GET_AMBISONIC        = 0x1201
    cast RF64_AUTO_DOWNGRADE        = 0x1210
    cast SET_VBR_ENCODING_QUALITY   = 0x1300
    cast SET_COMPRESSION_LEVEL      = 0x1301
    cast SET_OGG_PAGE_LATENCY_MS    = 0x1302
    cast SET_OGG_PAGE_LATENCY       = 0x1303
    cast SET_CART_INFO              = 0x1400
    cast GET_CART_INFO              = 0x1401
    cast SET_ORIGINAL_SAMPLERATE    = 0x1500
    cast GET_ORIGINAL_SAMPLERATE    = 0x1501

---- SOUND FILE DESCRIPTION STRINGS

data SoundFileDescriptor =
    Title |
    Copyright |
    Software |
    Artist |
    Comment |
    Date |
    Album |
    License |
    TrackNumber |
    Genre

Eq SoundFileDescriptor where
    Title == Title = True
    Copyright == Copyright = True
    Software == Software = True
    Artist == Artist = True
    Comment == Comment = True
    Date == Date = True
    Album == Album = True
    License == License = True
    TrackNumber == TrackNumber = True
    Genre == Genre = True
    _ == _ = False

Cast SoundFileDescriptor Int where
    cast Title          = 0x01
    cast Copyright      = 0x02
    cast Software       = 0x03
    cast Artist         = 0x04
    cast Comment        = 0x05
    cast Date           = 0x06
    cast Album          = 0x07
    cast License        = 0x08
    cast TrackNumber    = 0x09
    cast Genre          = 0x10

-- TODO: Add Int -> SoundFileDescriptor if needed.
