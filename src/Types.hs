module Types
    ( Game(..)
    , PlayRoundFn
    ) where

import System.Random (StdGen)

type Question = String
type Answer = String
type PlayRoundFn = StdGen -> (Question, Answer, StdGen)
type Description = String
data Game = Game Description PlayRoundFn