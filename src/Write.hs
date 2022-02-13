module Write (write) where

import System.Directory (createDirectoryIfMissing)
import System.FilePath.Posix (takeDirectory)

write :: FilePath -> String -> IO ()  
write path content = createAndWriteFile path content

createAndWriteFile :: FilePath -> String -> IO ()
createAndWriteFile path content = do
  createDirectoryIfMissing True $ takeDirectory path

  writeFile path content