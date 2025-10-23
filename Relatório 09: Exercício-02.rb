class Musico
  attr_reader :nome, :instrumento
  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end
  def tocar_partitura(peca)
    raise NotImplementedError, "Cada músico deve implementar tocar_partitura"
  end
  def to_s
    "#{nome} (#{instrumento})"
  end
end

class Pianista < Musico
  def tocar_partitura(peca)
    puts "#{nome} ao piano toca '#{peca}' com delicadeza e técnica."
  end
end

class Violinista < Musico
  def tocar_partitura(peca)
    puts "#{nome} no violino toca '#{peca}' com arco e expressão."
  end
end

class Maestro
  def initialize(musicos = [])
    @musicos = musicos
  end
  def adicionar(m)
    @musicos << m
  end
  def iniciar_ensaio(peca)
    @musicos.each do |m|
      m.tocar_partitura(peca)
    end
  end
  def mudar_foco(estado)
    @musicos.map { |m| "#{m.nome} agora está #{estado.capitalize}!" }
  end
end

m1 = Pianista.new("Kousei", "Piano")
m2 = Violinista.new("Kaori", "Violino")
m3 = Pianista.new("Sena", "Piano")
maestro = Maestro.new([m1, m2, m3])

print "Nome da peça: "
peca = gets&.chomp.to_s
puts "Iniciando ensaio de '#{peca}'..."
maestro.iniciar_ensaio(peca)
puts
focos = maestro.mudar_foco("concentrado")
focos.each { |f| puts f }
