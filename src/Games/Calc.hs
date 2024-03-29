module Games.Calc (game) where

import System.Random
import Types

game :: Game
game = Game description playRoundFn

description :: String
description = "What is the result of the expression?"

playRoundFn :: PlayRoundFn
playRoundFn gen =
    let (num1, gen1) = randomR (1, 10) gen
        (num2, gen2) = randomR (1, 10) gen1
        (operator, gen3) = generateRandomOperator gen2
        question = show num1 ++ " " ++ [operator] ++ " " ++ show num2
        answer = show $ calculate num1 num2 operator
    in (question, answer, gen3)

generateRandomOperator :: StdGen -> (Char, StdGen)
generateRandomOperator gen =
    let operators = "+-*"
        (index, newGen) = randomR (0, length operators - 1) gen
    in (operators !! index, newGen)

calculate :: Int -> Int -> Char -> Int
calculate num1 num2 '+' = num1 + num2
calculate num1 num2 '-' = num1 - num2
calculate num1 num2 '*' = num1 * num2
calculate _ _ _ = error "Invalid operator"