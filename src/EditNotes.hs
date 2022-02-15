module EditNotes (editById) where

import Data.Time.Clock
import Data.Time.Calendar
import Data.List

import System.IO
import System.Directory (doesFileExist, removeFile)
import Utils (formatDate, decodeYesOrNoAnswer)
import Readtxt (readNote)

import Notes
import Write (write)

editById :: Int -> IO()
editById id = do
  let path = "Notes/" ++ show id
  exist <- doesFileExist path 
  if exist
		then do
		editFileIfExist path id
		else do 
		putStrLn "\nNão existe nota com esse ID\n"		
		return ()

editFileIfExist :: FilePath -> Int -> IO ()
editFileIfExist path id = do
	originalNote <- readNote path
	now <- getCurrentTime
	let (year, month, day) = toGregorian $ utctDay now

	putStrLn("\n----> Para manter os dados antigos basta não digitar nada")
	putStrLn("\n----> Título da Nota: " ++ title originalNote)
	putStr "Novo título>> "
	noteTitle <- getLine

	putStrLn("\n----> Conteúdo da Nota: " ++ content originalNote)
	putStr "Novo conteúdo>> "
	noteContent <- getLine

	putStrLn("\n----> Etiqueta: " ++ tag originalNote)
	putStr "Nova etiqueta >> "
	noteTag <- getLine

	case pinned originalNote of
		True -> do
			putStrLn("Pinado: Sim")
		False -> do
			putStrLn("Pinado: Não")

	putStr "Fixar ou Desfixar >> "
	isNotePinnedString <- getLine

	let editedNote = NoteData {
			noteId=noteId originalNote, title=verifyString noteTitle (title originalNote),
			content=verifyString noteContent (content originalNote),
			createDateISO=createDateISO originalNote,
			lastUpdateDateISO=formatDate day month year,
			tag=verifyString noteTag (tag originalNote),
			pinned=decodeYesOrNoAnswer isNotePinnedString
	}
	let filePath = "./Notes/" ++ show id
	let fileContent = show editedNote
	removeFile filePath

	write filePath fileContent

	putStrLn "\nNota Editada com Sucesso!\n"

verifyString :: String -> String -> String
verifyString newComponent oldComponent = if isStringNull newComponent then newComponent else oldComponent

isStringNull :: String -> Bool
isStringNull "" = False
isStringNull _ = True

