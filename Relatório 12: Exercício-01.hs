module Main where

data Categoria = Arma | Pocao | Equipamento deriving Show

data Item = Item { nome :: String, categoria :: Categoria, preco :: Double } deriving Show

data CompraZelda = CompraZelda { itens :: [Item] } deriving Show

calculaDesconto :: [Item] -> Double
calculaDesconto xs
  | total > 200 = 0.1 * total
  | otherwise   = 0
  where
    total = sum (map preco xs)

valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda xs)
  | total > 200 = total - calculaDesconto xs
  | otherwise   = total + 15.0
  where
    total = sum (map preco xs)

ex1 :: CompraZelda
ex1 = CompraZelda [Item "Master Sword" Arma 150.0, Item "Hylian Shield" Equipamento 120.0]

ex2 :: CompraZelda
ex2 = CompraZelda [Item "Red Potion" Pocao 30.0]

ex3 :: CompraZelda
ex3 = CompraZelda [Item "Iron Shield" Equipamento 150.0, Item "Blue Potion" Pocao 30.0]

ex4 :: CompraZelda
ex4 = CompraZelda [Item "Full Armor" Equipamento 200.0]

formatCompra :: CompraZelda -> String
formatCompra (CompraZelda xs) = unlines $ map (\it -> "- " ++ nome it ++ " (" ++ show (categoria it) ++ "): R$ " ++ show (preco it)) xs

main :: IO ()
main = do
  let compras = [("Compra 1", ex1), ("Compra 2", ex2), ("Compra 3", ex3), ("Compra 4", ex4)]
  mapM_ (\(label, c) -> do
           putStrLn label
           putStrLn "Itens:"
           putStrLn $ formatCompra c
           putStrLn $ "Valor final: R$ " ++ show (valorFinal c)
           putStrLn ""
        ) compras
