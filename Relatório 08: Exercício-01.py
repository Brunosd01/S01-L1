class Personagem:
    def __init__(self, vida: int, resistencia: int):
        self._resistencia = int(resistencia)
        self.vida = vida
    @property
    def vida(self) -> int:
        return self._vida

    @vida.setter
    def vida(self, valor: int):
        if not isinstance(valor, int):
            raise TypeError("A vida deve ser um inteiro.")
        if valor < 0:
            raise ValueError("A vida não pode ser negativa.")
        self._vida = valor

    @property
    def resistencia(self) -> int:
        return self._resistencia

    def __str__(self) -> str:
        return f"Personagem com {self.vida} de vida"

    def __repr__(self) -> str:
        return f"Personagem(vida={self.vida}, resistencia={self.resistencia})"


class Cavaleiro(Personagem):
    def __init__(self, vida: int, resistencia: int, armadura_pesada: bool = False):
        super().__init__(vida, resistencia)
        if not isinstance(armadura_pesada, bool):
            raise TypeError("armadura_pesada deve ser um booleano.")
        self.armadura_pesada = armadura_pesada

    def __str__(self) -> str:
        tipo = "com armadura pesada" if self.armadura_pesada else "sem armadura pesada"
        return f"Cavaleiro {tipo} e com {self.vida} de vida"

    def __repr__(self) -> str:
        return (
            f"Cavaleiro(vida={self.vida}, resistencia={self.resistencia}, "
            f"armadura_pesada={self.armadura_pesada})"
        )

def ler_int_nao_negativo(prompt: str) -> int:
    while True:
        s = input(prompt).strip()
        try:
            v = int(s)
            if v < 0:
                print("Por favor, insira um número inteiro não-negativo.")
                continue
            return v
        except ValueError:
            print("Entrada inválida. Digite um número inteiro.")


def ler_bool_sim_nao(prompt: str) -> bool:
    while True:
        s = input(prompt + " (s/n): ").strip().lower()
        if s in ("s", "sim", "y", "yes", "1", "true", "t"):
            return True
        if s in ("n", "nao", "não", "no", "0", "false", "f"):
            return False
        print("Resposta inválida. Digite 's' para sim ou 'n' para não.")


# ---------- Programa principal ----------
def main():
    criados = []
    while True:
        print("\n--- Menu ---")
        print("1) Criar Personagem")
        print("2) Criar Cavaleiro")
        print("3) Listar criados")
        print("4) Sair")
        escolha = input("Escolha uma opção: ").strip()

        if escolha == "1":
            vida = ler_int_nao_negativo("Vida (inteiro): ")
            resistencia = ler_int_nao_negativo("Resistência (inteiro): ")
            p = Personagem(vida, resistencia)
            criados.append(p)
            print("Criado:", p)

        elif escolha == "2":
            vida = ler_int_nao_negativo("Vida (inteiro): ")
            resistencia = ler_int_nao_negativo("Resistência (inteiro): ")
            armadura = ler_bool_sim_nao("Possui armadura pesada?")
            c = Cavaleiro(vida, resistencia, armadura)
            criados.append(c)
            print("Criado:", c)

        elif escolha == "3":
            if not criados:
                print("Nenhum personagem criado ainda.")
            else:
                print("\nPersonagens criados:")
                for i, obj in enumerate(criados, 1):
                    print(f"{i}. {repr(obj)}")

        elif escolha == "4":
            print("Saindo. Até mais!")
            break

        else:
            print("Opção inválida. Tente novamente.")


if __name__ == "__main__":
    main()
