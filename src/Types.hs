module Types
    ( Game(..)
    , Description(..)
    , PlayRoundFn(..)
    , Question(..)
    , Answer(..)
    ) where

import System.Random (StdGen)

newtype Question = Question String
newtype Answer = Answer String
newtype PlayRoundFn = PlayRoundFn (StdGen -> (Question, Answer, StdGen))
newtype Description = Description String
data Game = Game Description PlayRoundFn