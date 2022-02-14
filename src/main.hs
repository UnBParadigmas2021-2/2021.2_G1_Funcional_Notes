import System.Environment
import System.IO

import Notes
import CreateNote
import Readtxt
import Deletetxt (deleteTxt)

main :: IO()
main = do
    -- CLI arguments
    args <- getArgs

    -- readNote

    content <- readNote "Notes/4"

    putStrLn $ show content
    deleteTxt "Notes/teste.txt"
