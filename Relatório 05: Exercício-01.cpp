#include <iostream>
int fibonacci(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return fibonacci(n - 1) + fibonacci(n - 2);
}
int main() {
    int n;
    std::cout << "Digite um numero inteiro nao-negativo: ";
    if (!(std::cin >> n) || n < 0) {
        std::cerr << "Entrada invalida. Informe um inteiro nao-negativo.\n";
        return 1;
    }

    int result = fibonacci(n);
    std::cout << "Fibonacci(" << n << ") = " << result << '\n';
    return 0;
}
