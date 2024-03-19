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
    let (start, gen1) = randomR (0, 10) gen :: (Int, StdGen)
        (step, gen2) = randomR (1, 10) gen1
        (size, gen3) = randomR (5, 15) gen2
        (index, gen4) = randomR (0, size - 1) gen3
        question = Question $ show $ mask index $ progression start step size
        answer = Answer $ show $ start + step * index;
    in (question, answer, gen4)

progression :: Int -> Int -> Int -> [String]
progression start step size = map show $ take size [start, start + step ..]

mask :: Int -> [String] -> [String]
mask _ [] = []
mask 0 (_:xs) = "*" : xs
mask index (x:xs) = x : mask (index - 1) xs