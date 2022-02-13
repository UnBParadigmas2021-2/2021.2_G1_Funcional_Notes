module Cli where

create :: [String] -> IO()
create args = 
    putStrLn "dummy function"


dispatch :: [(String, [String] -> IO ())]
dispatch = [
    ("create", create)
    ]


parseCommands :: [String] -> IO ()
parseCommands allArgs = do 

    let (command:args) = allArgs
    let action = lookup command dispatch

    case action of
        Nothing -> putStrLn "We don't have this command"
        Just action -> action args
