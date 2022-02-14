import System.Environment
import System.IO

import CreateNote
import ListNotes
import ListNotesByTag

import Deletetxt (deleteById)

main :: IO()
main = do
    -- CLI arguments
    args <- getArgs

    -- createNote
    listNotes
    -- listNotesByTag "work"
