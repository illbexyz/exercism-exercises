module Bob (responseFor) where

import Data.Char (isUpper, isSpace, isLetter)
import Data.List (dropWhileEnd)

isShouting :: String -> Bool
isShouting xs = all (\x -> isUpper x || not (isLetter x)) xs && any isUpper xs

trim :: String -> String
trim xs = dropWhile isSpace (dropWhileEnd isSpace xs)

responseFor :: String -> String
responseFor xs
    | null trimmedXs = "Fine. Be that way!"
    | isShouting trimmedXs && last trimmedXs == '!' = "Whoa, chill out!"
    | isShouting trimmedXs && last trimmedXs == '?' = "Calm down, I know what I'm doing!"
    | isShouting trimmedXs = "Whoa, chill out!"
    | last trimmedXs == '?' = "Sure."
    | all isSpace trimmedXs = "Fine. Be that way!"
    | otherwise = "Whatever."
    where trimmedXs = trim xs