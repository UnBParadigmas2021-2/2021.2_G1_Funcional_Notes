module Utils (decodeYesOrNoAnswer, formatTwoDigitNumber, formatDate, mapToFilePath, showListComponent) where

import Notes

decodeYesOrNoAnswer :: String -> Bool
decodeYesOrNoAnswer "s" = True
decodeYesOrNoAnswer _ = False

formatTwoDigitNumber :: Int -> String
formatTwoDigitNumber number | number > 9 = show number
                            | otherwise = "0" ++ show number

formatDate :: Int -> Int -> Integer -> String
formatDate day month year = do
    let formattedDay = formatTwoDigitNumber day
    let formattedMonth = formatTwoDigitNumber month

    show year ++ "-" ++ formattedMonth ++ "-" ++ formattedDay

mapToFilePath :: Int -> String
mapToFilePath noteId = "./Notes/" ++ show noteId

showListComponent :: Bool -> NoteData -> IO()
showListComponent showPinned note = do
    if showPinned
        then putStrLn("(F) " ++ formatTwoDigitNumber(noteId note) ++ " - " ++ title note ++ " [ " ++  tag note ++ " ]")
        else putStrLn("(-) " ++ formatTwoDigitNumber(noteId note) ++ " - " ++ title note ++ " [ " ++  tag note ++ " ]")
