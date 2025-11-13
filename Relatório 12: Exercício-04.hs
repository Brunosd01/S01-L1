module Main where

import Text.Printf

data TipoServico = Banho | Massagem | Banquete deriving Show

data Servico = Servico { nomeS :: String, tipoS :: TipoServico, precoBase :: Double } deriving Show

data StatusAt = EmAndamento | Finalizado | Cancelado deriving Show

data Atendimento = Atendimento { servicos :: [Servico], statusAt :: StatusAt } deriving Show

bonusEspiritual :: [Servico] -> Double
bonusEspiritual ss = aplicarDesconto (aplicarBonus soma)
  where
    soma = sum (map precoBase ss)
    aplicarBonus x
      | length ss > 3 = x * 1.25
      | otherwise     = x
    aplicarDesconto x
      | x > 500       = x * 0.9
      | otherwise     = x

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento (Atendimento _ Cancelado) = 0
valorFinalAtendimento (Atendimento ss _) = bonusEspiritual ss

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico (Atendimento [] _) = "Nenhum serviço"
descricaoPrimeiroServico (Atendimento (s:_) _) = nomeS s ++ " (" ++ show (tipoS s) ++ ")"

s1, s2, s3, s4, s5 :: Servico
s1 = Servico "Banho Relaxante" Banho 120.0
s2 = Servico "Massagem Profunda" Massagem 200.0
s3 = Servico "Banquete Real" Banquete 250.0
s4 = Servico "Banho de Ervas" Banho 80.0
s5 = Servico "Massagem Rápida" Massagem 60.0

at1, at2, at3, at4 :: Atendimento
at1 = Atendimento [s1, s4, s5, s2] EmAndamento
at2 = Atendimento [s3, s2] Finalizado
at3 = Atendimento [s3, s1] Finalizado
at4 = Atendimento [s2] Cancelado

formatServicos :: [Servico] -> String
formatServicos ss = unlines $ map (\s -> "- " ++ nomeS s ++ " (" ++ show (tipoS s) ++ "): R$ " ++ printf "%.2f" (precoBase s)) ss

mostrarAtendimento :: String -> Atendimento -> IO ()
mostrarAtendimento titulo a = do
  putStrLn titulo
  putStrLn $ "Status: " ++ show (statusAt a)
  putStrLn "Servicos:"
  putStrLn $ formatServicos (servicos a)
  putStrLn $ "Primeiro servico: " ++ descricaoPrimeiroServico a
  putStrLn $ "Valor final: R$ " ++ printf "%.2f" (valorFinalAtendimento a)
  putStrLn ""

main :: IO ()
main = do
  mostrarAtendimento "Atendimento 1 (Em andamento)" at1
  mostrarAtendimento "Atendimento 2 (Finalizado)" at2
  mostrarAtendimento "Atendimento 3 (Finalizado)" at3
  mostrarAtendimento "Atendimento 4 (Cancelado)" at4
