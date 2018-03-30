module Aula6 where

-- Polimorfismo Paramétrico

-- data [] a = [] | a : 
-- a : []
-- a : (a : ([] a))

-- Exemplo de Polimorfismo Paramétrico
data Lista a = Nulo | Cons a (Lista a) deriving Show

-- (:) :: a -> [a] -> [a]
-- inserir :: a -> Lista a -> Lista a
-- inserir elemento ls = Cons elemento ls

-- Cons 4 (Cons 3 (Cons 2 Nulo))
-- 4 : 3 : 2 : []
-- [4,3,2]

-- data Tree a = Null
--     | Leaf a
--     | Branch a (Tree a) (Tree a)
--     deriving Show
    
-- Branch 10 (Branch 8 (Leaf 7) (Branch 6 (Leaf 4) Nulo)) (Leaf 11)

-- emOrdem :: Tree a -> [a]
-- emOrdem Null = []
-- emOrdem (Leaf x) = [x]
-- emOrdem (Branch x l r) = emOrdem l ++ [x] ++ emOrdem r

-- let arv = Branch 12 (Branch 10 (Leaf 9) (Leaf 11)) (Branch 20 (Leaf 13) (Leaf 25))

data Curso = SI | ADS | GE | LOG | GP 

-- O deriving Show prove uma implementacao default para show

-- Typeclass: Serve para termos uma base de implementacao
-- de funcoes baseando-se em tipos (polimorfismo paramétrico)
-- Show Int -> Como mostrar inteiros na tela
-- Show Bool -> Como mostrar booleanos na tela
-- Eq Int -> Como comparar inteiros

-- Typeclasse sao vistos também como restricao
-- no sentido de polimorfismo paramétrico

-- O typeclass Show possui uma função chamada show

{-*
instance Show Curso where
    show SI = "Curso de PHP"
    show ADS = "Curso de COBOL..."
    show GE = "Nem sei..."
    show LOG = "Caminhão"
    show GP = "Navio?"
    
instance Show Curso where
    show SI == SI = False -- não reflexivo
    show ADS == SI = True -- não simetrico
    show SI == ADS = False -- não simetrico
    _ == _ = False -- não reflexivo
    a == b == c = False -- intransitivo
*-}

-- data Bolsa a = Bolsa a a

-- Show :: * -> GHC.Prim.Constraint
-- Qual tipo de x? x :: a
-- Qual tipo de y? y :: a
-- instance Show a => Show (Bolsa a) where
--     show (Bolsa x y) = "O primeiro eh: " ++ show x ++ ", O segundo eh: " ++ show y
    
{-*
class SimNao a where
    simnao :: a -> Bool

instance SimNao Bool where
    simnao = id

instance SimNao Int where
    simnao = even

instance SimNao [a] where
    simnao = even . length
*-}
















