module Engine (run) where

import System.Random
import Types

run :: Game -> IO ()
run game = do
    putStrLn "Welcome to the Brain Games!"
    putStrLn "Enter your name:"
    playerName <- getLine
    putStrLn $ "Hello, " ++ playerName ++ "!"
    let Game description playRoundFn = game
    putStrLn description
    let roundNumber = 1
    gen <- newStdGen
    playRound roundNumber playerName playRoundFn gen

playRound :: Int -> String -> PlayRoundFn -> StdGen -> IO ()
playRound roundNumber name playRoundFn gen
    | roundNumber > 3 = putStrLn $ "Congratulations, " ++ name ++ "!"
    | otherwise = do
        let (question, correctAnswer, newGen) = playRoundFn gen
        putStrLn $ "Question: " ++ question
        putStrLn "Enter your answer:"
        answer <- getLine
        if answer == correctAnswer
            then do
                putStrLn "Correct!"
                let nextRoundNumber = roundNumber + 1
                playRound nextRoundNumber name playRoundFn newGen
            else do
                putStrLn $ "'" ++ answer ++ "' is wrong answer ;(. Correct answer was '" ++ correctAnswer ++ "'."
                putStrLn $ "Let's try again, " ++ name ++ "!"
