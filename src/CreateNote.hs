module CreateNote (createNote) where

import Data.Time.Clock
import Data.Time.Calendar
import Data.List

import System.FilePath.Posix
import System.Directory

import Notes
import Utils (formatDate, decodeYesOrNoAnswer)
import Write (write)

nextNoteId :: [Int] -> Int
nextNoteId [] = 1
nextNoteId noteFilesList = last (sort noteFilesList) + 1

createNote :: IO()
createNote = do
    putStrLn "\n-------- Criar Nova Nota --------"
    
    putStrLn "\n----> Título da Nota"
    noteTitle <- getLine

    putStrLn "\n----> Conteúdo da Nota"
    noteContent <- getLine

    putStrLn "\n----> Etiqueta\n=> Se não quiser etiquetar a nota, deixe em branco."
    noteTag <- getLine

    putStrLn "\n----> Fixar Nota\n=> Insira s para sim e n para não."
    isNotePinnedString <- getLine

    now <- getCurrentTime
    let (year, month, day) = toGregorian $ utctDay now

    createDirectoryIfMissing True $ takeDirectory "./Notes/"
    noteFilesList <- listDirectory "./Notes/"
    let noteFilesListInt = map (read :: FilePath -> Int) noteFilesList
    let newNoteId = nextNoteId noteFilesListInt

    let note = NoteData {
        noteId=newNoteId, title=noteTitle, content=noteContent,
        createDateISO=formatDate day month year,
        lastUpdateDateISO=formatDate day month year,
        tag=noteTag, pinned=decodeYesOrNoAnswer isNotePinnedString
    }

    let filePath = "./Notes/" ++ show newNoteId 
    let fileContent = show note

    write filePath fileContent

    putStrLn "\nNota Criada com Sucesso!\n"
