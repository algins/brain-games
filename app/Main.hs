module Main (main) where

import Games.Calc
import System.Random
import Types

main :: IO ()
main = do
    let (Game (Description description) (PlayRound roundFn)) = game
    putStrLn description
    gen <- newStdGen
    playRound (PlayRound roundFn) gen

playRound :: PlayRound -> StdGen -> IO ()
playRound (PlayRound roundFn) gen = do
    let (Question question, Answer correctAnswer, newGen) = roundFn gen
    putStrLn question
    putStrLn "Enter your answer:"
    answer <- getLine
    if answer == correctAnswer
        then do
            putStrLn "Correct!"
            playRound (PlayRound roundFn) newGen
        else putStrLn "Incorrect! Game over."