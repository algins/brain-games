module Types
    ( Game(..)
    , Description(..)
    , PlayRound(..)
    , Question(..)
    , Answer(..)
    ) where

import System.Random (StdGen)

newtype Question = Question String
newtype Answer = Answer String
newtype PlayRound = PlayRound (StdGen -> (Question, Answer, StdGen))
newtype Description = Description String
data Game = Game Description PlayRound