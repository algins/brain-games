module Games.Progression
    ( game
    ) where

import System.Random
import Types

game :: Game
game = Game description playRound

description :: Description
description = Description "What number is missing in the progression?"

playRound :: PlayRound
playRound = PlayRound $ \gen ->
    let (start, gen1) = randomR (0, 10) gen
        (step, gen2) = randomR (1, 10) gen1
        (size, gen3) = randomR (5, 15) gen2
        (index, gen4) = randomR (0, size - 1) gen3
        question = Question . show . maskIndex index $ generateProgression start step size
        answer = Answer $ show $ start + step * index;
    in (question, answer, gen4)

generateProgression :: Int -> Int -> Int -> [String]
generateProgression start step size = map show $ take size [start, start + step ..]

maskIndex :: Int -> [String] -> [String]
maskIndex _ [] = []
maskIndex 0 (_:xs) = "*" : xs
maskIndex index (x:xs) = x : maskIndex (index - 1) xs