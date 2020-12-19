module Memory.Management

public export
interface Managed managed where
    private
    alloc : IO managed
    private
    annul : managed -> IO ()

    manage : (managed -> IO res) -> IO res
    manage work = do
        mortal <- alloc
        result <- work mortal
        annul mortal
        pure result
