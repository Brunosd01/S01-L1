class MicroondasUnidade
  def aquecer_por(segundos)
    puts "Unidade: aquecendo por #{segundos} segundos..."
  end
end

class DMail
  attr_reader :conteudo, :hora_envio
  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end
  def to_s
    "#{hora_envio} - #{conteudo}"
  end
end

class TelefoneDeMicroondas
  def initialize(unidade)
    @unidade = unidade
    @dmail_list = []
  end
  def enviar_dmail
    print "Conteúdo do D-Mail: "
    conteudo = gets&.chomp.to_s
    print "Hora de envio (HH:MM): "
    hora = gets&.chomp.to_s
    @unidade.aquecer_por(5)
    d = DMail.new(conteudo, hora)
    @dmail_list << d
    puts "D-Mail criado: #{d}"
  end
  def listar_dmails(horario_corte)
    corte = parse_minutos(horario_corte)
    @dmail_list.select { |d| parse_minutos(d.hora_envio) > corte }
  end
  private
  def parse_minutos(hhmm)
    parts = hhmm.to_s.split(":")
    return -1 unless parts.length == 2 && parts[0] =~ /^\d+$/ && parts[1] =~ /^\d+$/
    hours = parts[0].to_i
    mins = parts[1].to_i
    hours * 60 + mins
  end
end

unidade = MicroondasUnidade.new
telefone = TelefoneDeMicroondas.new(unidade)

loop do
  print "Deseja enviar um D-Mail? (s/n): "
  ans = gets&.chomp.to_s.downcase
  break if ans != "s"
  telefone.enviar_dmail
end

print "Informe o horário de corte (HH:MM) para listar D-Mails posteriores: "
corte = gets&.chomp.to_s
result = telefone.listar_dmails(corte)
if result.empty?
  puts "Nenhum D-Mail após #{corte}."
else
  puts "D-Mails após #{corte}:"
  result.each { |d| puts d }
end
