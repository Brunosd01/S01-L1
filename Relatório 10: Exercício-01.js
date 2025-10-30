class Pokemon {
  #vida;
  constructor(nome, tipo, vidaInicial) {
    this.nome = String(nome);
    this.tipo = String(tipo);
    this.#vida = Math.max(0, Number(vidaInicial) || 0);
  }
  getVida() {
    return this.#vida;
  }
  receberDano(dano) {
    const d = Math.max(0, Number(dano) || 0);
    this.#vida = Math.max(0, this.#vida - d);
  }
  _alterarVida(valor) {
    const v = Number(valor) || 0;
    this.#vida = Math.max(0, this.#vida + v);
  }
  atacar(alvo) {
    const dano = 5;
    if (alvo instanceof Pokemon) alvo.receberDano(dano);
    return dano;
  }
}

class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonusAtaque = 0) {
    super(nome, 'Fogo', vidaInicial);
    this.bonusAtaque = Number(bonusAtaque) || 0;
  }
  atacar(alvo) {
    const danoBase = 12;
    const dano = danoBase + this.bonusAtaque;
    if (alvo instanceof Pokemon) alvo.receberDano(dano);
    return dano;
  }
}

class PokemonAgua extends Pokemon {
  #curaBase;
  constructor(nome, vidaInicial, curaBase = 0) {
    super(nome, 'Água', vidaInicial);
    this.#curaBase = Number(curaBase) || 0;
  }
  atacar(alvo) {
    const dano = 10;
    if (alvo instanceof Pokemon) alvo.receberDano(dano);
    this._alterarVida(this.#curaBase);
    return dano;
  }
}

const char = new PokemonFogo('Charmander', 60, 4);
const squirt = new PokemonAgua('Squirtle', 55, 6);
const zubat = new Pokemon('Zubat', 'Voador', 30);

console.log(`${char.nome} (Fogo) vida antes:`, char.getVida());
console.log(`${squirt.nome} (Água) vida antes:`, squirt.getVida());
console.log(`${zubat.nome} (Genérico) vida antes:`, zubat.getVida());

console.log(`${char.nome} ataca ${zubat.nome} e causa`, char.atacar(zubat));
console.log(`${squirt.nome} ataca ${char.nome} e causa`, squirt.atacar(char));
console.log(`${zubat.nome} usa ataque genérico em ${squirt.nome} e causa`, zubat.atacar(squirt));

console.log(`${char.nome} vida depois:`, char.getVida());
console.log(`${squirt.nome} vida depois:`, squirt.getVida());
console.log(`${zubat.nome} vida depois:`, zubat.getVida());
