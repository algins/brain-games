module Games.Even
    ( game
    ) where

import System.Random
import Types

game :: Game
game = Game description playRound

description :: Description
description = Description "Answer \"yes\" if the number is even, otherwise answer \"no\"."

playRound :: PlayRound
playRound = PlayRound $ \gen ->
    let (num, newGen) = randomR (1, 10) gen :: (Int, StdGen)
        question = Question $ show num
        answer = Answer $ if even num then "yes" else "no"
    in (question, answer, newGen)