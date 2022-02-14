module Show (showNote) where

import System.Directory (createDirectoryIfMissing)
import System.FilePath.Posix (takeDirectory)
import Utils (mapToFilePath, formatTwoDigitNumber)
import Readtxt (readNote)
import Notes

showNote :: Int -> IO ()  
showNote id = do
  let filePath = mapToFilePath id
  notes <- readNote filePath
  case Notes.Nothing /= notes of
    True -> do
      putStrLn("Id: " ++ formatTwoDigitNumber(noteId notes) ++ " - Título: " ++ title notes )
      putStrLn("[ Data de criação: " ++  lastUpdateDateISO notes ++ " ]" ++ "[ Data da ultima atualização: " ++  lastUpdateDateISO notes ++ " ]")
      case pinned notes of
        True -> do
          putStrLn("Pinado: Sim")
        False -> do
          putStrLn("Pinado: Não")
      putStrLn("Etiqueta:" ++  tag notes)
      putStrLn("Conteúdo da nota: \n" ++ content notes )
    False -> do
          putStrLn("Não foi encontrado o id selecionado")


