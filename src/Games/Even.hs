module Games.Even (game) where

import System.Random
import Types
import Utils

game :: Game
game = Game description playRoundFn

description :: Description
description = Description "Answer \"yes\" if the number is even, otherwise answer \"no\"."

playRoundFn :: PlayRoundFn
playRoundFn = PlayRoundFn $ \gen ->
    let (num, newGen) = randomR (1, 10) gen
        question = Question $ show num
        answer = Answer . convertToAffirmation $ isEven num
    in (question, answer, newGen)

isEven :: Int -> Bool
isEven num = num `mod` 2 == 0