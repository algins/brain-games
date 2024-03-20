module Games.Prime
    ( game
    ) where

import System.Random
import Types
import Utils

game :: Game
game = Game description playRound

description :: Description
description = Description "Answer \"yes\" if the number is prime, otherwise answer \"no\"."

playRound :: PlayRound
playRound = PlayRound $ \gen ->
    let (num, newGen) = randomR (1, 10) gen
        question = Question $ show num
        answer = Answer . convertToAffirmation $ isPrime num
    in (question, answer, newGen)

isPrime :: Int -> Bool
isPrime num
    | num < 2 = False
    | any (\i -> num `mod` i == 0) [2 .. floor $ calculateIntegralSqrt num] = False
    | otherwise = True
        
calculateIntegralSqrt :: Int -> Double
calculateIntegralSqrt num = sqrt $ fromIntegral num