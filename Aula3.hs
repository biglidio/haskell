module Aula3 where

-- deriving ...

data Dia = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo deriving (Ord, Eq, Show)

agenda :: Dia -> String
agenda Segunda = "Dia meio bosta"
agenda Quarta = "Dia de futebol"
agenda Quinta = "Dia de Haskell"
agenda Sexta = "Dia de maldade"
agenda Sabado = "Dia de netflix"
-- PATTERN MATCHING: DESCONTRÓI TIPO DA ENTRADA DA FUNÇÃO
-- VOCÊ PODE USAR OS VALUES CONTRUCTOR COM SE FOSSE UM CASE
-- NESSE CASO, AS VARIÁVEIS POSSUEM UM PAPEL DE ENCERRAR O CASE
-- IGNORANDO OS VALUES CONSTRUCTOR LISTADOS
agenda _ = "Dias irrelevantes"

-- EXERCICIO: FAÇA UMA FUNÇÃO QUE RECEBA UM INT E DEVOLVA O DIA CORRESPONDENTE
-- 1 - DOMINGO, 2 - SEGUNDA, ... 7 - SABADO

toDia :: Int -> Dia
toDia 1 = Domingo
toDia 2 = Segunda
toDia 3 = Terca
toDia 4 = Quarta
toDia 5 = Quinta
toDia 6 = Sexta
toDia _ = Sabado

-- 2) CRIE O ITPO DAY QUE POSSUA COMO VALUE CONSTRUTOR OS DIAS EM INGLES.
-- CRIE A FUNCAO TRADUZIR QUE RECEBA UM DIA E DEVOLVA UM DAY

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Ord, Eq, Show)
traduzir :: Dia -> Day
traduzir Segunda = Monday
traduzir Terca = Tuesday
traduzir Quarta = Wednesday
traduzir Quinta = Thursday
traduzir Sexta = Friday
traduzir Sabado = Saturday
traduzir Domingo = Sunday




data Pergunta = Sim | Nao deriving Show
--data Aluno = Aluno String Int deriving Show

{--*
RECORD SYNTAX: DAR NOME AOS CAMPOS E COM ISSO GANHAMOS FUNCOES DE PROJECAO

data Aluno = Aluno {
        alunoNome :: String,
        alunoIdade :: Int
    } deriving Show
*--}

-- niver :: Aluno -> Aluno
-- niver (Aluno nome idade) = Aluno nome (idade+1)

data Curso = ADS | GE | GP | SI | LOG deriving Show

data Disciplina = Disciplina {
        disciplinaNome :: String,
        disciplinaCarga :: Int
    } deriving Show

data Aluno = Aluno {
        alunoNome :: String,
        alunoIdade :: Int,
        alunoCurso :: String,
        alunoDisciplina :: [Disciplina]
    } deriving Show


matricula :: Disciplina -> Aluno -> Aluno
matricula nova (Aluno n i c d) = Aluno n i c (nova:d)
-- matricula (Disciplina "Design" 120) (Aluno "Lucas" 24 "SI" [Disciplina "Logica" 80])





