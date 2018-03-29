module Trabalho where


-- foldl :: (b -> a -> b) -> b -> [a] -> b

-- 4.1
-- media :: [Double] -> Double

{-*
    reverso :: String -> String
    reverso [] = []
    reverso (x:xs) = reverso xs ++ [x]
*-}

{-*
    Exercício 4.3
    
    pares :: [Int] -> [Int]
    pares [] = []
    pares ps = filter isPar ps
    
    isPar :: Int -> Bool
    isPar x = mod x 2 == 0
    
    impares :: [Int] -> [Int]
    impares [] = []
    impares ps = filter isImpar ps
    
    isImpar :: Int -> Bool
    isImpar x = mod x 2 /= 0
*-}

{-*
    Exercício 4.5
    
    exercicio45 :: [Int] -> [Int]
    exercicio45 [] = []
    exercicio45 ns = map (2*) (filter isMultiplo ns)
    
    isMultiplo :: Int -> Bool
    isMultiplo x = mod x 4 /= 0
*-}

    -- Exercício 4.6
    func :: (String -> String) -> String -> String
    func f s = reverse s ++ f s
    
        f :: String -> String
        f x = " eh o reverso de " ++ x


    -- Exercício 4.8
    
    data Dinheiro = Dinheiro {
        valor :: Double,
        correncia :: Correncia
    } deriving (Ord, Eq, Show)
    
    data Correncia = Real | Dolar deriving (Ord, Eq, Show)
    
    converteParaDolar :: [Dinheiro] -> [Dinheiro]
    converteParaDolar [] = []
    converteParaDolar ds = map dolarParaReal ds

        realParaDolar :: Dinheiro -> Dinheiro
        realParaDolar (Dinheiro v Real) = (Dinheiro (v/3.32) Dolar)
        realParaDolar (Dinheiro v Dolar) = (Dinheiro v Dolar)
        
        dolarParaReal :: Dinheiro -> Dinheiro
        dolarParaReal (Dinheiro v Real) = (Dinheiro v Real)
        dolarParaReal (Dinheiro v Dolar) = (Dinheiro (v*3.32) Real)
        
        notDolar :: Dinheiro -> Bool
        notDolar (Dinheiro v c) = c /= Dolar
    
    filtraDolar :: [Dinheiro] -> [Dinheiro]
    filtraDolar [] = []
    filtraDolar ds = filter notDolar ds
    
    somarDolares :: [Dinheiro] -> Double
    somarDolares [] = 0.0
    somarDolares ds = sum $ map retornaValor $ filter isDolar ds
    
        isDolar :: Dinheiro -> Bool
        isDolar (Dinheiro v c) = c == Dolar
        
        retornaValor :: Dinheiro -> Double
        retornaValor (Dinheiro v c) = v
    
    qtyDolares :: [Dinheiro] -> Int
    qtyDolares [] = 0
    qtyDolares ds = length $ filter isDolar ds
    