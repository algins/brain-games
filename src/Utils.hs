module Utils (convertToAffirmation) where

convertToAffirmation :: Bool -> String
convertToAffirmation True = "yes"
convertToAffirmation False = "no"