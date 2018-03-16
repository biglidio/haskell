module Aula4 where

-- Retorna "n" fatorial - INCORRETO
fat :: Int -> Int
fat 0 = 1
fat 1 = 1
fat n = n * fat(n-1)

-- Retorna "n"ésimo do fibonaci
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)



-- Retorna "n" fatorial - CORRETO
fat :: Int -> Int
fat n
    | n <= 1 = 1
    | otherwise = n * fat(n-1)

-- GUARDS: CHECA, EM ORDEM, EXPRESSÕES BOOLEANAS NAS FUNÇÕES. QUANDO A EXPRESÃORDEM
-- FOR VERDADEIRA, ELE RETORNA O VALOR, SE FOR FALSO, ELE CHECA A PRÓXIMA A
-- EXPRESSÃO. ELE TERMINARÁ SE ENCONTRAR O otherwise OU ESGOTAR TODAS AS POSSIBILIDADES.
-- SE HOUVER FALHA EM SEU RACIOCÍNIO, A FUNÇÃO PODE SE TORNAR PARCIAL.

modulo :: Int -> Int
modulo x
    | x >= 0 = x
    | x < 0 = -x
    
modulo :: Int -> Int
modulo x
    | x > 0 = x
    | otherwise = -x

data Status = Magro | Saudavel | Gordo
    deriving Show

imc :: Double -> Double -> Either String Status
imc peso altura
    | peso <= 0 = Left "Peso inválido"
    | altura <= 0 = Left "Altura inválida"
    | calculo < 18 = Right Magro
    | calculo < 25 = Right Saudavel
    | otherwise = Right Gordo
    where
        calculo = peso/(altura*altura)
        
-- Função que elimina vogais de uma lista de caracteres
elimVogal :: String -> String
elimVogal [] = []
elimVogal (x:xs)
    | elem x "AEIOUaeiou" = elimVogal xs
    | otherwise = x : elimVogal xs
    
-- CURRYING: É O ATO DE CHAMAR UMA FUNÇÃO COM MENOS PARAMETROS DO QUE O PEDIDO.
-- ASSIM, CRIAR-SE-Á UMA NOVA FUNÇÃO QUE  RECEBE OS PARÂMETROS FALTANTES.
somar :: Int -> Int -> Int -> Int
somar x y z = x+y+z
-- let f = somar 1 2
-- f 3
-- 6

-- LAMBDAS: FUNÇÕES ANÔNIMAS
(\x y z -> x+y+z) 1 2 3

-- HIGH-ORDER FUNCTIONS: UMA FUNÇÃO QUE RECEBE VIA PARAMETRO OU RETORNA OUTRA FUNÇÃO
foo:: (Int -> Int) -> Int
foo f = 1 + f 5

-- TODO CURRYING É UMA HIGH-ORDER FUNCTIONS



