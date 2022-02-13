module Deletetxt (deleteTxt) where

import System.IO
import System.Directory (doesFileExist, removeFile)

deleteTxt :: FilePath -> IO ()
deleteTxt path = do
  deleteFileIfExist path

deleteFileIfExist :: FilePath -> IO ()
deleteFileIfExist path = do
  exist <- doesFileExist path 
  if exist
    then removeFile path
    else return ()
