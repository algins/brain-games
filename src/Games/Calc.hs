module Games.Calc
    ( game
    ) where

import System.Random
import Types

game :: Game
game = Game description playRound

description :: Description
description = Description "What is the result of the expression?"

playRound :: PlayRound
playRound = PlayRound $ \gen ->
    let (num1, gen1) = randomNumber gen
        (num2, gen2) = randomNumber gen1
        (operator, gen3) = randomOperator gen2
        question = Question $ show num1 ++ " " ++ [operator] ++ " " ++ show num2
        answer = Answer $ show $ calculate num1 num2 operator
    in (question, answer, gen3)

randomNumber :: StdGen -> (Int, StdGen)
randomNumber = randomR (1, 10)

randomOperator :: StdGen -> (Char, StdGen)
randomOperator gen =
    let operators = "+-*"
        (index, newGen) = randomR (0, length operators - 1) gen
    in (operators !! index, newGen)

calculate :: Int -> Int -> Char -> Int
calculate a b '+' = a + b
calculate a b '-' = a - b
calculate a b '*' = a * b
calculate _ _ _ = error "Invalid operator"