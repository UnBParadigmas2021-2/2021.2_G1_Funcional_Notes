module Deletetxt (deleteById) where

import System.IO
import System.Directory (doesFileExist, removeFile)

deleteById :: Int -> IO()
deleteById id = do
  let path = "Notes/" ++ show id
  deleteTxt path

deleteTxt :: FilePath -> IO ()
deleteTxt path = do
  deleteFileIfExist path

deleteFileIfExist :: FilePath -> IO ()
deleteFileIfExist path = do
  exist <- doesFileExist path 
  if exist
    then do
		removeFile path
		putStrLn "\nNota Excluída com Sucesso!\n"
    else do 
		putStrLn "\nNão existe nota com esse ID\n"		
		return ()
