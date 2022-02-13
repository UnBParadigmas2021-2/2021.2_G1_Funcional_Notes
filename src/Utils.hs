module Utils (decodeYesOrNoAnswer, formatTwoDigitNumber, formatDate) where

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
