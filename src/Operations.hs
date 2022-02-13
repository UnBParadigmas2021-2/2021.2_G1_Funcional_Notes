module Operations (create) where

import Data.Time.Clock
import Data.Time.Calendar
import Data.List

import System.Directory

import Notes
import Utils

create = do
    putStrLn "\n-------- Criar Nova Nota --------"
    
    putStrLn "\n----> Título da Nota"
    putStr ">> "
    noteTitle <- getLine

    putStrLn "\n----> Conteúdo da Nota"
    putStr ">> "
    noteContent <- getLine

    putStrLn "\n----> Etiqueta\n=> Se não quiser etiquetar a nota, deixe em branco."
    putStr ">> "
    noteTag <- getLine

    putStrLn "\n----> Fixar Nota\n=> Insira s para sim e n para não."
    putStr ">> "
    isNotePinnedString <- getLine

    now <- getCurrentTime
    let (year, month, day) = toGregorian $ utctDay now

    noteFilesList <- listDirectory "./Notes/"
    let noteFilesListInt = map (read :: FilePath -> Int) noteFilesList

    let note = NoteData {
        noteId=last (sort noteFilesListInt) + 1, title=noteTitle, content=noteContent,
        createDateISO=formatDate day month year,
        lastUpdateDateISO=formatDate day month year,
        tag=noteTag, pinned=decodeYesOrNoAnswer isNotePinnedString
    }

    -- TO-DO
    -- Enviar nota para ser persistida

    let noteShow = "\n" ++ show note
    putStrLn noteShow
