module ListNotesByTag (listNotesByTag) where

import System.FilePath.Posix
import System.Directory

import Data.List

import Readtxt
import Utils (mapToFilePath, showListComponent)
import Notes

showResults :: String -> [String] -> IO()
showResults _ [] = putStrLn "\n-\n"
showResults noteTag (h:t) = do
    note <- readNote h

    if (tag note == noteTag)
        then showListComponent (pinned note) note
        else putStr ""

    showResults noteTag t

listNotesByTag :: String -> IO()
listNotesByTag tag = do
    createDirectoryIfMissing True $ takeDirectory "./Notes/"

    noteFilesList <- listDirectory "./Notes/"
    putStrLn "\n-------- Notas por Etiqueta --------"

    let noteFilesListInt = map (read :: FilePath -> Int) noteFilesList    
    putStrLn ("\n----> Notas com a etiqueta " ++ tag ++ "\n")

    let sortedNoteFilesList = sort noteFilesListInt
    let noteFilePathList = map mapToFilePath sortedNoteFilesList

    showResults tag noteFilePathList

    putStrLn "(F) Nota Fixada [ Etiqueta ]\n"
