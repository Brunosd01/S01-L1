io.write("Número de elementos: ")
local n = tonumber(io.read())
local maior = nil

for i = 1, n do
  io.write("Elemento " .. i .. ": ")
  local num = tonumber(io.read())
  if maior == nil or num > maior then
    maior = num
  end
end
print("Maior número do vetor:", maior)
