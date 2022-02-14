module Readtxt (readNote) where

import System.IO
import Notes
import System.Directory (doesFileExist)

-- Return a IO NoteData
--
-- If FilePath does not exits this 
-- function will return Notes.Nothing,
-- this can be used to see if the file
-- exists or not
readNote:: FilePath -> IO NoteData
readNote path = do
    fileExists <- doesFileExist path


    case fileExists of 
        True -> do 
            handle <- openFile path ReadMode

            sData <- hGetLine handle

            hClose handle

            let oData = read sData :: NoteData

            return oData
        False -> 
            return Notes.Nothing
