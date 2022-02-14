module ListNotes (listNotes) where

import System.FilePath.Posix
import System.Directory

import Data.List

import Readtxt
import Notes
import Utils (formatTwoDigitNumber)

showResultsCount :: Int -> IO()
showResultsCount 0 = putStrLn "\n----> Nenhuma nota registrada.\n"
showResultsCount 1 = putStrLn "\n----> Uma nota registrada.\n"
showResultsCount n = do
    let msg = "\n----> " ++ show n ++ " notas registradas.\n"
    putStrLn msg

mapToFilePath :: Int -> String
mapToFilePath noteId = "./Notes/" ++ show noteId

showResult :: Bool -> NoteData -> IO()
showResult showPinned note = do
    if showPinned
        then putStrLn("(F) " ++ formatTwoDigitNumber(noteId note) ++ " - " ++ title note)
        else putStrLn("(-) " ++ formatTwoDigitNumber(noteId note) ++ " - " ++ title note)

showResults :: Bool -> [String] -> IO()
showResults _ [] = putStrLn ""
showResults showPinned (h:t) = do
    note <- readNote h

    if (pinned note == showPinned)
        then showResult showPinned note
        else putStr ""

    showResults showPinned t

listNotes :: IO()
listNotes = do
    putStrLn "\n-------- Suas Notas --------"

    createDirectoryIfMissing True $ takeDirectory "./Notes/"
    noteFilesList <- listDirectory "./Notes/"

    let numberOfNotes = length noteFilesList
    showResultsCount numberOfNotes

    let noteFilesListInt = map (read :: FilePath -> Int) noteFilesList
    let sortedNoteFilesList = sort noteFilesListInt
    let noteFilePathList = map mapToFilePath sortedNoteFilesList

    showResults True noteFilePathList
    showResults False noteFilePathList

    putStrLn "(F) Nota Fixada\n"
