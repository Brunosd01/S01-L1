class ODM_Gear {
  #gasRestante
  constructor(modelo) {
    this.modelo = String(modelo)
    this.#gasRestante = 100
  }
  usarGas(quantidade) {
    const q = Math.max(0, Number(quantidade) || 0)
    const usado = Math.min(q, this.#gasRestante)
    this.#gasRestante -= usado
    return usado
  }
  getGas() {
    return this.#gasRestante
  }
}

class Soldado {
  #gear
  constructor(nome, modeloGear = 'Padrão') {
    this.nome = String(nome)
    this.#gear = new ODM_Gear(modeloGear)
  }
  explorarTerritorio() {
    const gasto = 15
    const usado = this.#gear.usarGas(gasto)
    return `${this.nome} explorou (gasto ${usado}) — ${this.verificarEquipamento()}`
  }
  verificarEquipamento() {
    return `ODM: ${this.#gear.modelo} | gás restante: ${this.#gear.getGas()}`
  }
}

class Esquadriao {
  constructor(lider, membrosIniciais = []) {
    this.lider = lider
    this.membros = []
    if (lider) this.adicionarMembro(lider)
    membrosIniciais.forEach(m => this.adicionarMembro(m))
  }
  adicionarMembro(soldado) {
    if (!soldado || typeof soldado.explorarTerritorio !== 'function') {
      throw new Error('Membro deve implementar explorarTerritorio()')
    }
    this.membros.push(soldado)
  }
  explorarTerritorio() {
    return this.membros.map(m => m.explorarTerritorio()).join('\n')
  }
  relatarStatus() {
    return this.membros.map(m => m.verificarEquipamento())
  }
}

const levi = new Soldado('Levi', 'Blade-X')
const mike = new Soldado('Mike', 'Swift-2')
const hanji = new Soldado('Hanji', 'Scanner')

const esquadrao = new Esquadriao(levi, [mike, hanji])

console.log('=== Exploração ===')
console.log(esquadrao.explorarTerritorio())

console.log('\n=== Status ===')
console.log(esquadrao.relatarStatus())
