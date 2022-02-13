import System.Environment
import System.IO

import Notes
import CreateNote

import Readtxt (readTxt)
import Deletetxt (deleteTxt)

main :: IO()
main = do
    -- CLI arguments
    args <- getArgs

    createNote

    -- readNote

    content <- readTxt "Notes/teste.txt"
    deleteTxt "Notes/teste.txt"
