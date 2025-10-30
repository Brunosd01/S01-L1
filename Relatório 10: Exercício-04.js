class Hunter {
  #localizacao
  constructor(nome, local = 'desconhecido', idade = 0) {
    this.nome = String(nome)
    this.idade = Number(idade) || 0
    this.#localizacao = String(local)
  }
  getLocalizacao() {
    return this.#localizacao
  }
  rastrearLocal(lat, long) {
    this.#localizacao = `${lat},${long}`
    return `${this.nome} localizado em ${this.#localizacao}`
  }
}

class Especialista extends Hunter {
  #habilidade
  constructor(nome, habilidade) {
    super(nome)
    this.#habilidade = String(habilidade)
  }
  rastrearLocal(lat, long) {
    const pos = super.rastrearLocal(lat, long)
    return `${this.nome} (Especialista: ${this.#habilidade}) detectou posição ${lat},${long}`
  }
}

class Manipulador extends Hunter {
  #alvoAtual
  constructor(nome, alvo = null) {
    super(nome)
    this.#alvoAtual = alvo
  }
  setAlvo(hunter) {
    this.#alvoAtual = hunter
  }
  rastrearLocal(lat, long) {
    if (this.#alvoAtual && typeof this.#alvoAtual.rastrearLocal === 'function') {
      const res = this.#alvoAtual.rastrearLocal(lat, long)
      return `${this.nome} manipulou alvo -> ${res}`
    }
    return super.rastrearLocal(lat, long)
  }
}

class Batalhao {
  #hunters
  constructor() {
    this.#hunters = new Set()
  }
  adicionarHunter(hunter) {
    if (!hunter || typeof hunter.rastrearLocal !== 'function') throw new Error('Objeto inválido')
    const existe = Array.from(this.#hunters).some(h => h.nome === hunter.nome)
    if (existe) return false
    this.#hunters.add(hunter)
    return true
  }
  getNumHunters() {
    return this.#hunters.size
  }
  iniciarRastreamento(lat, long) {
    const resultados = []
    for (const h of this.#hunters) {
      resultados.push(h.rastrearLocal(lat, long))
    }
    return resultados
  }
}

const a = new Especialista('Aline', 'Perícia eletrônica')
const b = new Manipulador('Bruno')
const c = new Hunter('Carlos')

b.setAlvo(c)

const batalhao = new Batalhao()
batalhao.adicionarHunter(a)
batalhao.adicionarHunter(b)
batalhao.adicionarHunter(c)
batalhao.adicionarHunter(new Hunter('Carlos')) // tentativa de duplicata pelo nome

console.log('Total de hunters:', batalhao.getNumHunters())
console.log('Rastreamento:')
console.log(batalhao.iniciarRastreamento('-23.5505', '-46.6333').join('\n'))
