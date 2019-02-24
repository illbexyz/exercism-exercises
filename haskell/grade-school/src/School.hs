module School (School, add, empty, grade, sorted) where

import Data.Maybe (fromMaybe)
import Data.List (sort, sortOn)

type School = [(Int, [String])]

add :: Int -> String -> School -> School
add gradeNum student school =
    let mGrade = grade gradeNum school in
    case mGrade of
        [] ->
            (gradeNum, [student]) : school
        existingStudents ->
            let updatedStudents = student : existingStudents in
            map (\(g, ss) -> if g == gradeNum then (g, updatedStudents) else (g, ss)) school
                    
empty :: School
empty = []

grade :: Int -> School -> [String]
grade gradeNum school =
    let maybeGrade = lookup gradeNum school in
    sort $ fromMaybe [] maybeGrade

sorted :: School -> School
sorted school =
    let sortedByIndex = sortOn fst school in
    map (\(g, ss) -> (g, sort ss)) sortedByIndex