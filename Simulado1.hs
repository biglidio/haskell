module Simulado1 where

data Permissao = Admin | Regular | Convidado deriving (Show,Eq)

data Login = Login {
    email :: String,
    senha :: String,
    permissao :: Permissao
} deriving (Show, Eq)

-- Retorna a maior senha de uma lista de Login
isAdmin :: Login -> Bool
isAdmin (Login e s p) = p == Admin

maiorSenha :: [Login] -> String
maiorSenha [] = []
maiorSenha ((Login e s p):logins) | logins == [] = s
    | length s > (maximum $ map (length.senha) logins) = s
    | otherwise = maiorSenha logins

maiorSenhaAdmin :: [Login] -> String
maiorSenhaAdmin [] = []
maiorSenhaAdmin logins = maiorSenha $ filter isAdmin logins

-- Retorna, de uma lista de Login, as senhas que não possuem caracteres numéricos
isRegular :: Login -> Bool
isRegular (Login e s p) = p == Regular

contemNumero :: Login -> Bool
contemNumero (Login e s p) = elem True $ [elem n s | n <- "0123456789"]

senhasComNumeros :: [Login] -> [String]
senhasComNumeros [] = []
senhasComNumeros logins = map senha $ filter contemNumero $ filter isRegular logins

-- Retorna a soma dos tamanhos de uma lista de Login
somarLengthSenhas :: [Login] -> Int
somarLengthSenhas [] = 0
somarLengthSenhas logins = sum $ map (length.senha) logins

-- Retorna, de uma lista de Login, todos os emails que contenham @
possuemArroba :: [Login] -> [Login]
possuemArroba [] = []
possuemArroba logins = filter possuiArroba logins

possuiArroba :: Login -> Bool
possuiArroba (Login e s p) = elem '@' e

-- Retorna, de uma lista de Login, todos os que contém permissão Regular OU Admin
isRegularAdmin :: Login -> Bool
isRegularAdmin (Login e s p) = (p == Admin) || (p == Regular)

todosRegularAdmin :: [Login] -> [Login]
todosRegularAdmin [] = []
todosRegularAdmin logins = filter isRegularAdmin logins

-- Retorna a quantidade de Admin de uma lista de Login
qtyAdmins :: [Login] -> Int
qtyAdmins [] = 0
qtyAdmins logins = length $ filter isAdmin logins

-- senhasComNumeros [(Login "ju@hotmail" "1234567" Admin),(Login "lucas" "frajola" Admin),(Login "alexandre@fatec" "123456789" Convidado)]