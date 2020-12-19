module Demo.FileInfo
import System
import System.Path
import Sound.File.SndFile.FFI

showTag : Maybe String -> String
showTag = maybe "(none)" id

printError : SoundFileError -> IO ()
printError = putStrLn . show

main : IO ()
main = do
    args <- getArgs
    case args of
        Nil => do
            putStrLn "impossible"
            exitWith (ExitFailure 0xDEAD)
        (_ :: Nil) => putStrLn "Append a sound file path to the command."
        (_ :: (pathstr ::_)) => do
            let path = parse pathstr
            if hasTrailSep path
                then do
                    putStrLn "Please specify a file, not a directory."
                    exitWith (ExitFailure 0xF17E)
                else do
                    ver <- sf_version_string
                    putStrLn $ "Detected " ++ ver
                    putStrLn $ "Trying to open file '" ++ show path ++ "'..."
                    sf_manage Read () path (\sf => do
                        putStrLn "TODO: PRINT FILE DATA"
                        pure ()
                     ) (printError) (printError)
			-- sfwith file Read (\sf => do
			-- 	putStrLn $ "--- Info ---"
			-- 	let info = info sf
			-- 	putStrLn $ "Frames: " ++ (show $ frames info)
			-- 	putStrLn $ "Sample Rate: " ++ (show $ samplerate info)
			-- 	putStrLn $ "Channels: " ++ (show $ channels info)
			-- 	putStrLn $ "Format: " ++ (show $ type $ format info) ++
			-- 				" (" ++ (show $ subtype $ format info) ++
			-- 				"/" ++ (show $ endian $ format info) ++ ")"
			-- 	putStrLn $ "Sections: " ++ (show $ sections info)
			-- 	putStrLn $ "Seekable: " ++ (show $ seekable info)
			-- 	putStrLn $ "--- Tags ---"
			-- 	let tags = tags sf
			-- 	putStrLn $ "Title: " ++ (showTag $ title tags)
			-- 	putStrLn $ "Copyright: " ++ (showTag $ copyright tags)
			-- 	putStrLn $ "Software: " ++ (showTag $ software tags)
			-- 	putStrLn $ "Artist: " ++ (showTag $ artist tags)
			-- 	putStrLn $ "Comment: " ++ (showTag $ comment tags)
			-- 	putStrLn $ "Date: " ++ (showTag $ date tags)
			-- 	putStrLn $ "Album: " ++ (showTag $ album tags)
			-- 	putStrLn $ "License: " ++ (showTag $ license tags)
			-- 	putStrLn $ "Track number: " ++ (showTag $ tracknumber tags)
			-- 	putStrLn $ "Genre: " ++ (showTag $ genre tags)
			-- 	--putStr $ "Enter 'y' to print: "
			-- 	--case !(getLine) of
			-- 	--	"y" => do
			-- 	--		sfwork sf (prim__truncBigInt_Int $ frames info) (printFrameArray) (putStrLn "Couldn't work with file!")
			-- 	--	_ => pure ()
			-- ) (\(err, str) => putStrLn $ "Error: " ++ str)
