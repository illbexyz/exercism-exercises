module CollatzConjecture
  ( collatz
  ) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise =
    Just $ fromIntegral $ length $ takeWhile (/= 1) (iterate collatzStep n)

collatzStep :: Integer -> Integer
collatzStep n
  | even n = n `div` 2
  | otherwise = 3 * n + 1
