module Main where

import Text.Printf

data Genero = Rock | Pop | Jazz | Metal | Eletronica deriving Show

data Banda = Banda { nomeB :: String, genero :: Genero, cache :: Double } deriving Show

data Status = Ativo | Encerrado | Cancelado deriving Show

data Evento = Evento { bandas :: [Banda], statusEvento :: Status } deriving Show

custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ Cancelado) = 0.0
custoTotalEvento (Evento bs _) = total * 1.2
  where
    total = sum (map cache bs)

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _) = "Sem bandas no evento"
bandaAbertura (Evento (b:_) _) = nomeB b

bandaFechamento :: Evento -> String
bandaFechamento (Evento [] _) = "Sem bandas no evento"
bandaFechamento (Evento bs _) = nomeB (last bs)

exEventoAtivo :: Evento
exEventoAtivo = Evento
  [ Banda "Os Acordes" Rock 5000.0
  , Banda "Luz e Som" Pop 3000.0
  , Banda "Bateria Selvagem" Metal 4000.0
  ] Ativo

exEventoEncerrado :: Evento
exEventoEncerrado = Evento
  [ Banda "Jazz Nights" Jazz 2500.0
  , Banda "Easy Trio" Jazz 1800.0
  ] Encerrado

exEventoCancelado :: Evento
exEventoCancelado = Evento
  [ Banda "Falso Show" Rock 1200.0 ] Cancelado

formatBandas :: [Banda] -> String
formatBandas bs = unlines $ map (\b -> "- " ++ nomeB b ++ " (" ++ show (genero b) ++ "): R$ " ++ printf "%.2f" (cache b)) bs

mostrarEvento :: String -> Evento -> IO ()
mostrarEvento titulo ev = do
  putStrLn titulo
  putStrLn $ "Status: " ++ show (statusEvento ev)
  putStrLn "Bandas:"
  putStrLn $ formatBandas (bandas ev)
  putStrLn $ "Abertura: " ++ bandaAbertura ev
  putStrLn $ "Fechamento: " ++ bandaFechamento ev
  putStrLn $ "Custo total: R$ " ++ printf "%.2f" (custoTotalEvento ev)
  putStrLn ""

main :: IO ()
main = do
  mostrarEvento "Evento 1 (Ativo)" exEventoAtivo
  mostrarEvento "Evento 2 (Encerrado)" exEventoEncerrado
  mostrarEvento "Evento 3 (Cancelado)" exEventoCancelado
