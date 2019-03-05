module Bob (responseFor) where

import Data.Char (isUpper, isSpace, isLetter)
import Data.List (dropWhileEnd)

trim :: String -> String
trim xs = dropWhile isSpace (dropWhileEnd isSpace xs)

isShouting :: String -> Bool
isShouting xs = all (\x -> isUpper x || not (isLetter x)) xs && any isUpper xs

isQuestion :: String -> Bool
isQuestion xs = last xs == '?'

isShoutingAQuestion :: String -> Bool
isShoutingAQuestion xs = isShouting xs && isQuestion xs

isOnlyWhitespace :: String -> Bool
isOnlyWhitespace xs = all isSpace xs

responseFor :: String -> String
responseFor [] = "Fine. Be that way!"
responseFor xs
    | isOnlyWhitespace xs = "Fine. Be that way!"
    | isShoutingAQuestion trimmedXs = "Calm down, I know what I'm doing!"
    | isShouting trimmedXs = "Whoa, chill out!"
    | isQuestion trimmedXs = "Sure."
    | otherwise = "Whatever."
    where trimmedXs = trim xs