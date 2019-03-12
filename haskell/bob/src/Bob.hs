module Bob (responseFor) where

import Data.Char (isLower, isUpper, isSpace)
import Data.List (isSuffixOf)

removeSpaces :: String -> String
removeSpaces = filter (not . isSpace)

isShouting :: String -> Bool
isShouting xs = all (not . isLower) xs && any isUpper xs

isQuestion :: String -> Bool
isQuestion = ("?" `isSuffixOf`) 

isShoutingAQuestion :: String -> Bool
isShoutingAQuestion xs = isShouting xs && isQuestion xs

responseFor :: String -> String
responseFor xs
    | null noSpacesXs = "Fine. Be that way!"
    | isShoutingAQuestion noSpacesXs = "Calm down, I know what I'm doing!"
    | isShouting noSpacesXs = "Whoa, chill out!"
    | isQuestion noSpacesXs = "Sure."
    | otherwise = "Whatever."
    where noSpacesXs = removeSpaces xs
