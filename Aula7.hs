module Aula6 where

import Data.Monoid

data And = And Bool deriving Show

instance Monoid And where
    mempty = And True
    mappend = (And x) (And y) = And (x && y)

data Bolsa a = Bolsa a a deriving Show

instance Monoid a => Monoid (Bolsa a) where
    mempty = Bolsa mempty mempty
    mappend (Bolsa b1 b2) (Bolsa b3 b4) = Bolsa (b1 <> b3) (b2 <> b4)
    
-- Bolsa (Sum 3) (Sum 5) <> Bolsa (Sum 7) (Sum 3)
-- Resultado: Bolsa (Sum 10) (Sum 8)