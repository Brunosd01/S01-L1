from abc import ABC, abstractmethod
class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao
    @abstractmethod
    def usar_ultimate(self):
        """Cada classe filha deve implementar sua ultimate."""
        raise NotImplementedError
    def __str__(self):
        return f"{self.nome} ({self.funcao})"
class Tanque(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self):
        print(f"{self.nome} ativa a ultimate do Tanque: escudo gigantesco que protege a equipe!")


class Dano(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(f"{self.nome} ativa a ultimate de Dano: ataque concentrado que causa muito dano aos inimigos!")

if __name__ == "__main__":
    lista_herois = [
        Tanque("Reinhardt"),
        Dano("Tracer"),
        Tanque("Orisa"),
        Dano("Soldado-76")
    ]
    for heroi in lista_herois:
        print(heroi)
        heroi.usar_ultimate()
        print()
