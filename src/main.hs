import System.Environment
import System.IO

import Notes
import Operations
import Write (write)

main :: IO()
main = do
    -- CLI arguments
    args <- getArgs
    write "Notes/teste.txt" "something\nTeste1\nTeste2"
    create
