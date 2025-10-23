class Drink
  attr_reader :nome
  def initialize(nome, preco_base)
    @nome = nome
    self.preco_base = preco_base
  end
  def preco_base
    @preco_base
  end
  def preco_base=(valor)
    raise ArgumentError, "Preço deve ser positivo" if valor.to_f <= 0
    @preco_base = valor.to_f
  end
  def preco_final
    @preco_base
  end
  def to_s
    "#{nome}: R$#{'%.2f' % preco_final}"
  end
end

class DrinkComum < Drink
  def to_s
    "#{nome} (Comum): R$#{'%.2f' % preco_final}"
  end
end

class DrinkLenda < Drink
  attr_reader :anos_desde_criacao
  def initialize(nome, preco_base, anos_desde_criacao)
    @anos_desde_criacao = anos_desde_criacao.to_i
    super(nome, preco_base)
  end
  def preco_final
    @preco_base + 5 * anos_desde_criacao
  end
  def to_s
    "#{nome} (Lenda, #{anos_desde_criacao} anos): R$#{'%.2f' % preco_final}"
  end
end

print "Nome do drink: "
nome = gets.chomp
print "Preço base: "
preco = gets.chomp
print "Idade do drink (anos): "
anos = gets.chomp

begin
  drink = if anos.to_i > 0
    DrinkLenda.new(nome, preco, anos)
  else
    DrinkComum.new(nome, preco)
  end
  puts drink.to_s
rescue ArgumentError => e
  puts "Erro: #{e.message}"
end
