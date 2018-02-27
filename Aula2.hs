module Aula2 where

-- Comentário
{-*
    Declaração de Função onde: 
    "dobro" é o nome da função
    "x" é o parâmetro
    "2*x" é a expressão
*-}
--dobro x = 2*x
--somar x y z = x+y+z

-- Função nomeada "u" que retorna "7", ou seja, uma constante.
u = 7

-- Função Recursiva em Loop Infinito
--x = x+1

-- Tipando valores
{-*
    dobro :: Double -> Double
    dobro x = 2*x
    
    soma :: Int -> Int -> Int
    soma x y = x+y
    
    divisao :: Int -> Int -> Double
    divisao x y = x/y
    
--DICA: A QUANTIDADE DE SETAS INDICA A QUANTIDADE DE PARAMETROS, POIS O ÚLTIMO É O TIPO DO RETORNO

*-}


nomeCompleto :: String -> String -> Int
nomeCompleto txt1 txt2 = length (txt1++txt2)

--LISTA COMPREHESION
{-*
    lista :: [Int]
    lista = [1 .. 100]
    lista = [2, 4 .. 100]
    lista = [1, 3 .. 99]
    lista = [100 .. 1]
    lista = [99 .. 3, 1]
    lista = [99, 97 .. 1]
    lista = [x | x <- [1 .. 100]]
    lista = [2*x+1 | x <- [1 .. 100]]
    lista = [2*x+1 | x <- [1 .. 100], x > 11]
    lista = [x | x <- [1 .. 40], mod x 4 /= 0]
    lista = [x | x <- [1 .. 40], mod x 4 /= 0, x > 7]
    
    lista :: [String]
    lista = [x | x <- ["HASKELL", "PHP", "JAVA", "JAVASCRIPT", "COBOL"], length x > 4]
*-}

--PASSANDO TUPLA COMO PARÂMETRO
somar :: (Int, Int, Int) -> Int
somar (x, y, z) = x+y+z

--CRIAR PARES DE ALUNOS
--[(x, y) | x <-["ANNA", "LUCAS", "THIAGO", "BEATRIZ"],  y <-["ANNA", "LUCAS", "THIAGO", "BEATRIZ"], x /= y]

--CRIAR BARALHO
--[(x, y) | x <- "A234567890JQK", y <- ["OUROS", "ESPADAS", "COPAS", "PAUS"]]