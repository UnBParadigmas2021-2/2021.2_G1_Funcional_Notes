module Readtxt (readTxt) where

import System.IO
import System.Directory (doesFileExist)

readTxt :: FilePath -> IO String  
readTxt path = do
  content <- readFileIfExist path
  return content

readFileIfExist :: FilePath -> IO String
readFileIfExist path = do
  exist <- doesFileExist path 
  if exist
    then readFileThatExist path
    else return ""
  
readFileThatExist :: FilePath -> IO String
readFileThatExist path = do
  contents <- readFile' path
  return contents
