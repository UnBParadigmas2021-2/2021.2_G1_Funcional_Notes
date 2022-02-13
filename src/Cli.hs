module Cli (parseCommands) where

import Operations as Ops

-- Register a command to a string
dispatch :: [(String, [String] -> IO ())]
dispatch = [
    ("create", createNote)
    ]

-- Command calls implementation
createNote :: [String] -> IO()
createNote args =
    Ops.create

-- Documentation text
helpText =
    "create          Create a note\n"


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
        Nothing -> putStrLn "We don't have this command"
        Just action -> action args
