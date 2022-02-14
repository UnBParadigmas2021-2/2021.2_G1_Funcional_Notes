import System.Environment
import System.IO

import CreateNote
import ListNotes
import ListNotesByTag

import Deletetxt (deleteById)
import Show (showNote)

main :: IO()
main = do
    -- CLI arguments
    args <- getArgs

    -- createNote
    showNote 1
    -- listNotes
    -- listNotesByTag "work"
