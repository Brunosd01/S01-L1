from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self, custo: float, funcao: str):
        self.custo = float(custo)
        self.funcao = funcao
    def __str__(self):
        return f"Implante(funcao={self.funcao}, custo={self.custo})"

class NetRunner(Cibernetico):
    def __init__(self, nome: str, custo_implante: float, funcao_implante: str):
        self.nome = nome
        self.implante = Implante(custo_implante, funcao_implante)
    def realizar_hack(self):
        print(f"{self.nome} realizando hack usando '{self.implante.funcao}' (custo: {self.implante.custo})")

class Faccao:
    def __init__(self, membros=None):
        self.membros = list(membros) if membros is not None else []
    def adicionar(self, membro: Cibernetico):
        self.membros.append(membro)
    def executar_hacks(self):
        for membro in self.membros:
            membro.realizar_hack()

if __name__ == "__main__":
    nr1 = NetRunner("ZeroCool", 1500, "Infiltrar sistemas de segurança")
    nr2 = NetRunner("AcidBurn", 2000, "Extração de dados")
    nr3 = NetRunner("CrashOverride", 1200, "Desestabilizar redes")
    faccao = Faccao([nr1, nr2])
    faccao.adicionar(nr3)
    faccao.executar_hacks()
