module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text =
  let lowerCaseText = map toLower text
   in all (`elem` lowerCaseText) ['a' .. 'z']
