module Engine (run) where

import System.Random
import Types

run :: Game -> IO ()
run game = do
    putStrLn "Welcome to the Brain Games!"
    putStrLn "Enter your name:"
    name <- getLine
    putStrLn ("Hello, " ++ name ++ "!")
    let Game (Description description) (PlayRoundFn playRoundFn) = game
    putStrLn description
    gen <- newStdGen
    playRound 1 name (PlayRoundFn playRoundFn) gen

playRound :: Int -> String -> PlayRoundFn -> StdGen -> IO ()
playRound roundNumber name (PlayRoundFn playRoundFn) gen
    | roundNumber == 4 = putStrLn ("Congratulations, " ++ name ++ "!")
    | otherwise = do
        let (Question question, Answer correctAnswer, newGen) = playRoundFn gen
        putStrLn ("Question: " ++ question)
        putStrLn "Enter your answer:"
        answer <- getLine
        if answer == correctAnswer
            then do
                putStrLn "Correct!"
                playRound (roundNumber + 1) name (PlayRoundFn playRoundFn) newGen
            else do
                putStrLn $ "'" ++ answer ++ "' is wrong answer ;(. Correct answer was '" ++ correctAnswer ++ "'."
                putStrLn $ "Let's try again, " ++ name ++ "!"
