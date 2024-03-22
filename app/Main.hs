module Main (main) where

import qualified Games.Calc as Calc
import qualified Games.Even as Even
import qualified Games.Gcd as Gcd
import qualified Games.Prime as Prime
import qualified Games.Progression as Progression
import Engine

evenGameNumber, calcGameNumber, gcdGameNumber, progressionGameNumber, primeGameNumber :: String
evenGameNumber = "1"
calcGameNumber = "2"
gcdGameNumber = "3"
progressionGameNumber = "4"
primeGameNumber = "5"

main :: IO ()
main = do
    putStrLn "Please enter the game number and press Enter."
    putStrLn ""
    mapM_ putStrLn menu
    putStrLn ""
    putStrLn "Your choice:"
    gameNumber <- getLine
    putStrLn ""
    runGame gameNumber

runGame :: String -> IO ()
runGame gameNumber
    | gameNumber == evenGameNumber = run Even.game
    | gameNumber == calcGameNumber = run Calc.game
    | gameNumber == gcdGameNumber = run Gcd.game
    | gameNumber == progressionGameNumber = run Progression.game
    | gameNumber == primeGameNumber = run Prime.game
    | otherwise = putStrLn "Invalid game number!"

menu :: [String]
menu = 
    [ evenGameNumber ++ " - Even"
    , calcGameNumber ++ " - Calc"
    , gcdGameNumber ++ " - GCD"
    , progressionGameNumber ++ " - Progression"
    , primeGameNumber ++ " - Prime"
    ]
