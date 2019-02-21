module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year | isYearDivisible 400 = True
                | isYearDivisible 4 && not (isYearDivisible 100) = True
                | otherwise           = False
    where isYearDivisible divisor = year `rem` divisor == 0