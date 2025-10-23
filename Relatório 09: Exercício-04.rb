module Rastreavel
  def obter_localizacao(hora)
    raise NotImplementedError, "Implementar obter_localizacao em classes que incluem Rastreavel"
  end
end

module Perigoso
  def calcular_risco
    raise NotImplementedError, "Implementar calcular_risco em classes perigosas"
  end
end

class Participante
  attr_reader :nome
  attr_accessor :localizacao
  def initialize(nome)
    @nome = nome
  end
  def to_s
    nome
  end
end

class Detetive < Participante
  include Rastreavel
  def obter_localizacao(hora)
    "#{nome} (Detetive) localizado em #{localizacao} às #{hora}"
  end
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso
  def obter_localizacao(hora)
    "#{nome} (MestreDoCrime) localizado em #{localizacao} às #{hora}"
  end
  def calcular_risco
    horas = Time.now.strftime("%H").to_i
    base = localizacao.to_s.length
    (base * 4 + horas) % 100
  end
  def to_s
    "#{nome} (Criminoso) - local: #{localizacao}"
  end
end

class Cenario
  def initialize
    @participantes = []
  end
  def adicionar(participante)
    @participantes << participante
  end
  def participantes
    @participantes.dup
  end
  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end
end

print "Localização atual de Sherlock: "
loc_sherlock = gets&.chomp.to_s
print "Localização atual de Moriarty: "
loc_moriarty = gets&.chomp.to_s

sherlock = Detetive.new("Sherlock")
moriarty = MestreDoCrime.new("Moriarty")
sherlock.localizacao = loc_sherlock
moriarty.localizacao = loc_moriarty

cenario = Cenario.new
cenario.adicionar(sherlock)
cenario.adicionar(moriarty)

hora_atual = Time.now.strftime("%H:%M")
puts
puts "Status dos participantes:"
cenario.participantes.each do |p|
  puts p.obter_localizacao(hora_atual)
end

puts
ameacas = cenario.identificar_ameacas
if ameacas.empty?
  puts "Nenhuma ameaça encontrada."
else
  puts "Ameaças identificadas:"
  ameacas.each do |a|
    puts "#{a.nome} - risco calculado: #{a.calcular_risco}"
  end
end
