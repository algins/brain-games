module Games.Gcd (game) where

import System.Random
import Types

game :: Game
game = Game description playRoundFn

description :: Description
description = Description "Find the greatest common divisor of given numbers."

playRoundFn :: PlayRoundFn
playRoundFn = PlayRoundFn $ \gen ->
    let (num1, gen1) = randomR (0, 10) gen
        (num2, gen2) = randomR (0, 10) gen1
        question = Question $ show num1 ++ " " ++ show num2
        answer = Answer . show $ calculateGcd num1 num2
    in (question, answer, gen2)

calculateGcd :: Int -> Int -> Int
calculateGcd num1 0 = num1
calculateGcd num1 num2 = calculateGcd num2 $ num1 `mod` num2
