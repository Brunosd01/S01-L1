local function calculadora(a, b, op)
  a = tonumber(a)
  b = tonumber(b)
  if not a or not b then
    return "erro"
  end
  if type(op) ~= "string" then
    return "erro"
  end

  op = op:match("^%s*(.-)%s*$")

  if op == "+" then
    return a + b
  elseif op == "-" then
    return a - b
  elseif op == "*" then
    return a * b
  elseif op == "/" then
    if b == 0 then return "erro" end
    return a / b
  else
    return "erro"
  end
end

io.write("Digite a: ")
local a = io.read()
io.write("Digite b: ")
local b = io.read()
io.write("Digite o operador (+, -, *, /): ")
local op = io.read()

local resultado = calculadora(a, b, op)
print(resultado)
