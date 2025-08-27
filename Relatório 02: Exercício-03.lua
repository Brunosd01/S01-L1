io.write("Número de elementos: ")
local n = tonumber(io.read())

local pares = {}

for i = 1, n do
  io.write("Elemento " .. i .. ": ")
  local num = tonumber(io.read())
  if num == math.floor(num) and num % 2 == 0 then
    table.insert(pares, num)
  end
end

if #pares == 0 then
  print("Nenhum número par encontrado.")
else
  local strs = {}
  for i, v in ipairs(pares) do strs[i] = tostring(v) end
  print("Tabela de pares: {" .. table.concat(strs, ", ") .. "}")
end
