print("Digite o primeiro número:")
local m = tonumber(io.read())
print("Digite o segundo número:")
local n = tonumber(io.read())
print("Digite o número x:")
local x = tonumber(io.read())

if not m or not n or not x then
  print("Entrada inválida.")
  return
end

x = math.abs(x)

local primeiro = math.ceil(m / x) * x

if primeiro > n then
  print("Não há múltiplos de " .. x .. " em [" .. m .. ", " .. n .. "].")
else
  print("Múltiplos de " .. x .. " em [" .. m .. ", " .. n .. "]:")
  for v = primeiro, n, x do
    print(v)
  end
end
