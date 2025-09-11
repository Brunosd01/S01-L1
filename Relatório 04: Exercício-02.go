package main

import (
	"fmt"
)

func main() {
	var num int
	fmt.Print("Digite um número inteiro: ")
	_, err := fmt.Scanf("%d", &num)
	if err != nil {
		fmt.Println("Entrada inválida. Certifique-se de digitar um inteiro.")
		return
	}
	switch r := num % 2; r {
	case 0:
		fmt.Println("O número é par")
	case 1, -1:
		fmt.Println("O número é ímpar")
	default:
		fmt.Printf("Residuo inesperado: %d\n", r)
	}
}
