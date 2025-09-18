#include <iostream>
#include <limits>
#include <iomanip>
double celsiusParaFahrenheit(double celsius) {
    return (celsius * 9.0 / 5.0) + 32.0;
}
double celsiusParaKelvin(double celsius) {
    return celsius + 273.15;
}

int main() {
    int opcao;
    do {
        std::cout << "\n--- Conversor de Unidades ---\n";
        std::cout << "1. Converter Celsius para Fahrenheit\n";
        std::cout << "2. Converter Celsius para Kelvin\n";
        std::cout << "3. Sair\n";
        std::cout << "Escolha uma opcao: ";
        if (!(std::cin >> opcao)) {
            std::cin.clear();
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
            std::cout << "Entrada invalida. Digite um numero entre 1 e 3.\n";
            continue;
        }
        switch (opcao) {
            case 1: {
                double c;
                std::cout << "Digite a temperatura em Celsius: ";
                while (!(std::cin >> c)) {
                    std::cin.clear();
                    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                    std::cout << "Entrada invalida. Digite uma temperatura (numero): ";
                }
                double f = celsiusParaFahrenheit(c);
                std::cout << std::fixed << std::setprecision(2);
                std::cout << c << " C = " << f << " F\n";
                break;
            }
            case 2: {
                double c;
                std::cout << "Digite a temperatura em Celsius: ";
                while (!(std::cin >> c)) {
                    std::cin.clear();
                    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                    std::cout << "Entrada invalida. Digite uma temperatura (numero): ";
                }
                double k = celsiusParaKelvin(c);
                std::cout << std::fixed << std::setprecision(2);
                std::cout << c << " C = " << k << " K\n";
                break;
            }
            case 3:
                std::cout << "Saindo...\n";
                break;
            default:
                std::cout << "Opcao invalida. Escolha 1, 2 ou 3.\n";
                break;
        }
    } while (opcao != 3);
    return 0;
}
