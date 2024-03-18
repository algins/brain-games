module Games.Gcd
    ( game
    ) where

import System.Random
import Types

game :: Game
game = Game description playRound

description :: Description
description = Description "Find the greatest common divisor of given numbers."

playRound :: PlayRound
playRound = PlayRound $ \gen ->
    let (num1, gen1) = randomNumber gen
        (num2, gen2) = randomNumber gen1
        question = Question $ show num1 ++ " " ++ show num2
        answer = Answer $ show $ gcd num1 num2
    in (question, answer, gen2)

randomNumber :: StdGen -> (Int, StdGen)
randomNumber = randomR (0, 10)