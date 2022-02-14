module Notes (NoteData(..)) where

data NoteData = NoteData {
    noteId :: Int,
    title :: String,
    content :: String,
    createDateISO :: String,
    lastUpdateDateISO :: String,
    tag :: String,
    pinned :: Bool
}| Nothing deriving (Show, Eq, Read)
