import System.Environment
import System.IO

import CreateNote
import ListNotes

main :: IO()
main = do
    -- CLI arguments
    args <- getArgs

    createNote
    listNotes

    -- deleteTxt "Notes/teste.txt"
