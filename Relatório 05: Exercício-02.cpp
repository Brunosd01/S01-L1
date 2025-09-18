#include <iostream>
using namespace std;
float somarArray(float arr[], int tamanho) {
    float soma = 0.0;
    for (int i = 0; i < tamanho; i++) {
        soma += arr[i];
    }
    return soma;
}
int main() {
    int tamanho;
    cout << "Digite o tamanho do array: ";
    cin >> tamanho;
    float arr[tamanho]; // cria o array de floats
    cout << "Digite " << tamanho << " valores:\n";
    for (int i = 0; i < tamanho; i++) {
        cin >> arr[i];
    }
    float resultado = somarArray(arr, tamanho);
    cout << "Soma dos valores = " << resultado << endl;
    return 0;
}
