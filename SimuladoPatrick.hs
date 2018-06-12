module Simulado where

import Data.Monoid

-- 1 ------------

-- data Permissao = Admin | Regular | Convidado

-- data Login = Login
--     { email :: String
--     , senha :: String
--     , permissao :: Permissao
--     }

-- maiorAdmin :: [Login] -> String
-- maiorAdmin xs = foldl (\a b -> if length (senha b) > length a then senha b else a) []
--     . filter (\x -> permissao x == Admin) $ xs

-- semNumeros :: [Login] -> [String]
-- semNumeros xs = let regulares = filter (\x -> permissao x == Regular) $ xs in
--     map fst . filter snd $ zip
--         (map senha regulares)
--         (map (\s -> and $ map (\x -> notElem x (senha s)) "0123456789") regulares)

-- somaSenhas :: [Login] -> Int
-- somaSenhas xs = mconcat . map (Sum . length . senha) $ xs

-- loginsArroba :: [Login] -> [Login]
-- loginsArroba xs = map fst . filter snd $ zip xs
--     (map (\s -> elem '@' email s) xs)

-- regularesAdmins :: [Login] -> [Login]
-- regularesAdmins xs = filter
--     (\x -> (permissao x) == Regular || (permissao x) == Admin) xs

-- adminQuantidade :: [Login] -> Int
-- adminQuantidade xs = length . filter (\x -> permissao x == Admin) $ xs

-- 2 ------------

-- Nand não é um Monóide pois não possui um elemento neutro.

data Browser = Firefox | Chrome | Safari | Opera | Edge

instance Monoid Browser where
    mempty = Edge
    mappend _ _ = Firefox

-- Chrome  <> (Safari  <> Opera) = Firefox
-- (Chrome <>  Safari) <> Opera  = Firefox

-- 3 ------------

-- :kind Either String Int
-- *
-- :kind Either
--      *      -> * -> *
-- data Either    a    b

-- :kind Tripla String
-- *
-- :kind Tripla
-- * -> *

data Tripla a = Tripla Int a a a

-- Qual o kind de Tripla String?
-- O kind de `Tripla String` é *

-- Crie uma instância de Functor para Tripla.
instance Functor Tripla where
    fmap f (Tripla i x y z) = Tripla i (f x) (f y) (f z)

--          Tripla String = Tripla Int String  String  String
-- Qual o tipo da expressão Tripla 5   "False" "False" "True"?
-- Tripla String

-- Qual o tipo da expressão Tripla 7?
-- a -> a -> a -> Tripla a
-- :t Tripla 7 True
-- Bool -> Bool -> Tripla Bool
-- :t Tripla
-- Int -> a -> a -> a -> Tripla a

-- Crie uma instância de Show que mostre na tela sua tripla em formato de tuplas.
-- Por exemplo, Tripla 1 2 3 4 deverá ser mostrado (2, 3, 4)
instance Show a => Show (Tripla a) where
    show (Tripla _ x y z) = show (x, y, z)

-- Qual o kind de Tripla?
-- O kind de `Tripla` é * -> *

-- 4 ------------

-- função parcial

foo :: Int -> [Int] -> String
foo 4 [] = "Olá"
foo 9 [1,23] = "Mundo"
foo x [] = "Olá mundo"
-- foo _ _ = "Olá novamente"

-- foo 10 [1]

g1 :: Double -> Double -> Double
g1 x y = x - y

-- g2 :: Monoid a => a -> a
g2 x = mconcat [x, mempty, x]

-- :t (.)
-- (.) :: (b -> c) -> (a -> b) -> a -> c

-- id a = a

g3 :: ([a], [a]) -> [a]
g3 = id . tail . fst . id

-- id . tail . fst . id ([1,2,3], [4,5,6])
-- id . tail . fst ([1,2,3], [4,5,6])
-- id . tail [1,2,3]
-- id [2,3]
-- [2,3]

-- Quais funções são parciais?
-- g3, pois uma lista vazia [] não possui "tail" e esse caso não é coberto.

-- Quais funções são polimórficas? Explique.
-- g2 e g3, pois não definem nenhum tipo "rígido"

-- Qual o tipo da função g2?
-- g2 :: Monoid a => a -> a

-- É possível reescrever g1 como função polimórfica com restrição Monoid?
-- Se sim, reescreva-a.
-- Não é possível como subtração, apenas generalizado:
g1' :: Monoid a => a -> a -> a
g1' x y = x <> y

-- O que faz a função g3?
-- Pega o "tail" de uma lista que está na primeira coordenada de uma tupla.

-- 5 ------------

f1 :: (a, ()) -> a
f1 x = fst x
-- f1 = fst

f2 :: (b -> a, b -> c) -> b -> (a, c)
f2 x = \b -> (   (fst x) b    ,     (snd x) b   )
--               b -> a             b -> c

f3 :: (a -> b) -> a -> b
f3 g a =   g      a
--       a -> b

f4 :: (a, b, c, d, e, f, g) -> d
f4 (_, _, _, d, _, _, _) = d

zip' :: [a] -> [b] -> [(a, b)]
zip' [x]    [y]    = (x, y)
--   (x:[]) (y:[])
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

f5 :: (a -> b -> c) -> [a] -> [b] -> [c]
f5 f xs ys = map (\(a, b) -> f a b) $ zip' xs ys
-- f5 = zipWith