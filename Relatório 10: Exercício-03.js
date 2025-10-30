class Criatura {
  constructor(nome, perigosa = false) {
    this.nome = String(nome)
    this.perigosa = Boolean(perigosa)
  }
}

class Diario {
  #autorSecreto
  constructor(autor) {
    this.#autorSecreto = String(autor)
    this.enigmas = new Map()
    this.criaturasAvistadas = []
  }
  getAutor() {
    return this.#autorSecreto
  }
  adicionarEnigma(num, enigma) {
    this.enigmas.set(Number(num), String(enigma))
  }
  decodificar(chave, num) {
    if (chave !== this.#autorSecreto) return 'Acesso negado'
    const texto = this.enigmas.get(Number(num))
    return texto ? `Enigma #${num}: ${texto}` : 'Nada encontrado'
  }
}

class Personagem {
  constructor(nome, idade) {
    this.nome = String(nome)
    this.idade = Number(idade) || 0
  }
}

class Protagonista extends Personagem {
  constructor(nome, idade, autorDiario) {
    super(nome, idade)
    this.diario = new Diario(autorDiario)
  }
}

class CabanaMisterio {
  constructor() {
    this.funcionarios = []
    this.visitantes = []
  }
  adicionarFuncionario(personagem) {
    if (personagem instanceof Personagem) this.funcionarios.push(personagem)
  }
  listarFuncionarios() {
    return this.funcionarios
  }
}

const dipper = new Protagonista('Dipper', 12, 'AutorSecreto123')
dipper.diario.adicionarEnigma(1, 'O portal está ativo.')
dipper.diario.adicionarEnigma(2, 'Cuidado com Bill Cipher.')

console.log(dipper.diario.decodificar('AutorSecreto123', 1))
console.log(dipper.diario.decodificar('errada', 2))

const mabel = new Personagem('Mabel', 12)
const stan = new Personagem('Tio Stan', 58)
const cabana = new CabanaMisterio()
cabana.adicionarFuncionario(stan)
cabana.adicionarFuncionario(mabel)

console.log('Funcionários da Cabana Mistério:')
cabana.listarFuncionarios().forEach(p => console.log(`${p.nome}, ${p.idade} anos`))
