module Cli (parseCommands) where

import CreateNote
import ListNotes
import ListNotesByTag

-- Register a command to a string
dispatch :: [(String, [String] -> IO ())]
dispatch = [
    ("create", create),
    ("show-all", showAll),
    ("show-tagged", showTagged)
    ]

-- Command calls implementation
create :: [String] -> IO()
create args =
    createNote

showAll :: [String] -> IO()
showAll args =
    listNotes

showTagged :: [String] -> IO()
showTagged args = do
     let tag = head args
     listNotesByTag tag

-- Documentation text
helpText =
    "Usage:\n" ++
    "create\tCreate a note\n" ++
    "show-all\tShow all notes\n" ++
    "show-tagged tag\t Show all notes with the tag 'tag'\n"

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
