module Cli (parseCommands) where

import Text.Read

import CreateNote
import ListNotes
import ListNotesByTag
import EditNotes
import Deletetxt
import Show

-- Register a command to a string
dispatch :: [(String, [String] -> IO ())]
dispatch = [
    ("create", create),
    ("show", showOne),
    ("show-all", showAll),
    ("show-tagged", showTagged),
    ("delete", delete),
    ("edit", edit)
    ]

-- Try to get the id as Int
runWithId :: [String] -> (Int -> IO()) -> IO()
runWithId args fun = do
    let id = readMaybe (head args) :: Maybe Int
    case id of
        Just id -> fun id
        Nothing -> putStrLn "Invalid note id"

-- Command calls implementation
create :: [String] -> IO()
create args =
    createNote

showOne :: [String] -> IO()
showOne args =
    runWithId args showNote

showAll :: [String] -> IO()
showAll args =
    listNotes

showTagged :: [String] -> IO()
showTagged args = do
     let tag = head args
     listNotesByTag tag

edit :: [String] -> IO()
edit args =
    runWithId args editById

delete :: [String] -> IO()
delete args =
    runWithId args deleteById

-- Documentation text
helpText =
    "Usage:\n" ++
    "create\tCreate a note\n" ++
    "show note-id\tDetail a note with id 'note-id' and its contents\n" ++
    "show-all\tShow all notes\n" ++
    "show-tagged tag\tShow all notes with the tag 'tag'\n" ++
    "delete note-id\tDelete note with id 'note-id'\n" ++
    "edit note-id\tEdit the note with id 'note-id'\n"

-- Get all arguments from cli and parse then
-- If there is a empty list of arguments this
-- function just shows the helpText in screen
--
-- If the command sended by the user don't have
-- a action match, a error message will be showed
parseCommands :: [String] -> IO ()
parseCommands [] = putStrLn helpText
parseCommands allArgs = do

    let (command:args) = allArgs
    let action = lookup command dispatch

    case action of
        Nothing -> do
            putStrLn "We don't have this command\n"
            putStrLn helpText
        Just action -> action args
