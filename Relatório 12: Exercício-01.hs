module Main where

data Tipo = Cafe | Cha | Suco deriving Show

data Bebida = Bebida { nome :: String, tipo :: Tipo, preco :: Double } deriving Show

data Status = Aberto | Entregue | Cancelado deriving Show

data Pedido = Pedido { bebidas :: [Bebida], status :: Status } deriving Show

valorTotalPedido :: Pedido -> Double
valorTotalPedido (Pedido _ Cancelado) = 0
valorTotalPedido (Pedido bs _) = sum (map preco bs) + 5.0

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _) = "Nenhuma bebida no pedido"
primeiraBebida (Pedido (b:_) _) = nome b

ex1 :: Pedido
ex1 = Pedido
  [ Bebida "Café Premium" Cafe 12.0
  , Bebida "Chá Verde" Cha 8.0
  ] Aberto

ex2 :: Pedido
ex2 = Pedido
  [ Bebida "Suco de Laranja" Suco 10.0 ] Entregue

ex3 :: Pedido
ex3 = Pedido [] Aberto

ex4 :: Pedido
ex4 = Pedido
  [ Bebida "Café Amargo" Cafe 7.0 ] Cancelado

mostrarPedido :: Pedido -> String
mostrarPedido (Pedido bs st) =
  "Status: " ++ show st ++ "\n" ++
  unlines (map (\b -> "- " ++ nome b ++ " (" ++ show (tipo b) ++ "): R$ " ++ show (preco b)) bs)

main :: IO ()
main = do
  let pedidos = [("Pedido 1", ex1), ("Pedido 2", ex2), ("Pedido 3", ex3), ("Pedido 4", ex4)]
  mapM_ (\(t, p) -> do
           putStrLn t
           putStrLn $ mostrarPedido p
           putStrLn $ "Primeira bebida: " ++ primeiraBebida p
           putStrLn $ "Valor total: R$ " ++ show (valorTotalPedido p)
           putStrLn ""
        ) pedidos
