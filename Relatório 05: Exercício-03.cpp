#include <iostream>
#include <limits>
#include <iomanip>
int main() {
    int quantidade;
    std::cout << "Quantas notas voce vai inserir? ";
    if (!(std::cin >> quantidade) || quantidade < 0) {
        std::cerr << "Entrada invalida. Informe um numero inteiro nao-negativo.\n";
        return 1;
    }
    if (quantidade == 0) {
        std::cout << "Nenhuma nota inserida. Media = 0.00\n";
        std::cout << "Status: Reprovado\n";
        return 0;
    }
    float soma = 0.0f;
    for (int i = 0; i < quantidade; ) {
        float nota;
        std::cout << "Digite a nota #" << (i + 1) << " (0 a 10): ";

        if (!(std::cin >> nota)) {
            std::cin.clear();
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
            std::cout << "Entrada invalida. Digite um numero entre 0 e 10.\n";
            continue;
        }
        if (nota < 0.0f || nota > 10.0f) {
            std::cout << "Nota fora do intervalo. Deve ser entre 0 e 10. Tente novamente.\n";
            continue;
        }
        soma += nota;
        ++i;
    }
    float media = soma / quantidade;
    std::cout << std::fixed << std::setprecision(2);
    std::cout << "\nSoma das notas = " << soma << '\n';
    std::cout << "Media = " << media << '\n';
    if (media >= 7.0f) {
        std::cout << "Status: Aprovado\n";
    } else {
        std::cout << "Status: Reprovado\n";
    }
    return 0;
}
