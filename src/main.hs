import System.Environment
import System.IO

import CreateNote
import ListNotes
import Deletetxt (deleteById)

main :: IO()
main = do
    -- CLI arguments
    args <- getArgs

    createNote
    listNotes

    -- deleteTxt "Notes/teste.txt"
