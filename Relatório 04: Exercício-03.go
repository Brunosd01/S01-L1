package main

import (
	"fmt"
)

func fibonacci(n int) []uint64 {
	if n <= 0 {
		return []uint64{}
	}
	seq := make([]uint64, n)
	var a, b uint64 = 0, 1
	for i := 0; i < n; i++ {
		seq[i] = a
		a, b = b, a+b
	}
	return seq
}

func main() {
	var n int
	fmt.Print("Quantos números da sequência de Fibonacci você quer? ")
	_, err := fmt.Scanf("%d", &n)
	if err != nil {
		fmt.Println("Entrada inválida. Digite um inteiro.")
		return
	}

	seq := fibonacci(n)
	if len(seq) == 0 {
		fmt.Println("Nenhum número para mostrar.")
		return
	}

	fmt.Println("Sequência de Fibonacci:")
	for i, v := range seq {
		fmt.Printf("%d: %d\n", i+1, v)
	}
}
