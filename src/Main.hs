import System.Environment
import System.IO

import Cli

main :: IO()
main = do
    -- CLI arguments
    args <- getArgs
    parseCommands args
