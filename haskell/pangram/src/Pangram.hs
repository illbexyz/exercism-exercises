module Pangram (isPangram) where

import Data.Char (toLower)
import Data.Set  (empty, fromAscList, isSubsetOf, singleton, unions)

isPangram :: String -> Bool
isPangram text =
  let lowerCaseText = map toLower text
      alphabetSet = fromAscList ['a' .. 'z']
      -- Every letter of the alphabet is mapped to a:
      --   * singleton set if it's contained in the input string, 
      --   * empty set otherwise
      -- Then the inputSet will be the union of these sets

      -- Note: The map operation will still diverge if the given string
      -- is both infinite and not a pangram
      inputSet =
        unions $                                           
        map                                 
          (\letter ->                       
             if letter `elem` lowerCaseText
               then singleton letter
               else empty)
          ['a' .. 'z']
   in alphabetSet `isSubsetOf` inputSet
