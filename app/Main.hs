module Main (main) where

import qualified Games.Calc as Calc
import qualified Games.Even as Even
import qualified Games.Gcd as Gcd
import qualified Games.Prime as Prime
import qualified Games.Progression as Progression
import Engine
import System.Exit (exitSuccess)

main :: IO ()
main = do
    putStrLn "Please enter the game number and press Enter."
    putStrLn "Your choice:"
    choice <- getLine
    putStrLn ""
    case choice of
        "1" -> run Even.game
        "2" -> run Calc.game
        "3" -> run Gcd.game
        "4" -> run Progression.game
        "5" -> run Prime.game
        _  -> exitSuccess