from typing import List
class ArmaCorpoACorpo:
    def __init__(self, nome: str, dano: int):
        self.nome = nome
        self.dano = int(dano)

    def __str__(self) -> str:
        return f"{self.nome} (dano: {self.dano})"

    def __repr__(self) -> str:
        return f"ArmaCorpoACorpo(nome={self.nome!r}, dano={self.dano})"


class PhantomThieves:
    def __init__(self, nome: str, arma: ArmaCorpoACorpo):
        self.nome = nome
        self.arma = arma

    def __str__(self) -> str:
        return f"{self.nome} - arma: {self.arma}"

    def __repr__(self) -> str:
        return f"PhantomThieves(nome={self.nome!r}, arma={self.arma!r})"


class Joker:
    def __init__(self, nome: str, nome_arma: str, dano_arma: int, equipe: List[PhantomThieves] = None):
        self.nome = nome
        self.arma = ArmaCorpoACorpo(nome_arma, dano_arma)
        self.equipe = list(equipe) if equipe is not None else []

    def mostrar_equipe(self):
        if not self.equipe:
            print(f"{self.nome} não tem membros na equipe no momento.")
            return

        print(f"Equipe de {self.nome}:")
        for i, membro in enumerate(self.equipe, 1):
            print(f"{i}. {membro.nome} — arma: {membro.arma.nome} (dano: {membro.arma.dano})")

    def adicionar_membro(self, membro: PhantomThieves):
        self.equipe.append(membro)
        print(f"{membro.nome} adicionado(a) à equipe de {self.nome}.")

    def remover_membro_por_nome(self, nome_membro: str) -> bool:
        for m in self.equipe:
            if m.nome == nome_membro:
                self.equipe.remove(m)
                print(f"{m.nome} removido(a) da equipe de {self.nome}.")
                return True
        print(f"Membro '{nome_membro}' não encontrado na equipe de {self.nome}.")
        return False

    def mostrar_info_joker(self):
        print(f"Joker: {self.nome}")
        print(f"Arma do Joker (composição): {self.arma}")

    def __repr__(self) -> str:
        return f"Joker(nome={self.nome!r}, arma={self.arma!r}, equipe={self.equipe!r})"

if __name__ == "__main__":

    arma_morgana = ArmaCorpoACorpo("Adaga Sombria", 25)
    arma_ann = ArmaCorpoACorpo("Faca Elegante", 20)
    arma_ryuji = ArmaCorpoACorpo("Punho de Ferro", 30)

    membro1 = PhantomThieves("Morgana", arma_morgana)
    membro2 = PhantomThieves("Ann", arma_ann)
    membro3 = PhantomThieves("Ryuji", arma_ryuji)

    equipe_inicial = [membro1, membro2]
    joker = Joker(nome="Joker", nome_arma="Faca Rebelde", dano_arma=35, equipe=equipe_inicial)
    joker.mostrar_info_joker()
    print()
    joker.mostrar_equipe()
    print()
    joker.adicionar_membro(membro3)
    print()
    joker.mostrar_equipe()
    print()
    joker.remover_membro_por_nome("Ann")
    print()
    joker.mostrar_equipe()
    print("\nRepr do objeto Joker (inspeção):")
    print(repr(joker))
