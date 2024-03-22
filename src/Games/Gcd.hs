module Games.Gcd (game) where

import System.Random
import Types

game :: Game
game = Game description playRoundFn

description :: String
description = "Find the greatest common divisor of given numbers."

playRoundFn :: PlayRoundFn
playRoundFn gen =
    let (num1, gen1) = randomR (0, 10) gen
        (num2, gen2) = randomR (0, 10) gen1
        question = show num1 ++ " " ++ show num2
        answer = show $ calculateGcd num1 num2
    in (question, answer, gen2)

calculateGcd :: Int -> Int -> Int
calculateGcd num1 0 = num1
calculateGcd num1 num2 = calculateGcd num2 $ num1 `mod` num2
