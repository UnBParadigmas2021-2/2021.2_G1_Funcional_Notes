import System.Environment
import System.IO

import Notes
import CreateNote

import Readtxt (readTxt)
import Deletetxt (deleteById)

main :: IO()
main = do
    -- CLI arguments
    args <- getArgs

    createNote

    -- readNote

