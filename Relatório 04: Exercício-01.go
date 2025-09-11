package main
import (
	"fmt"
)
func classificar_numero(num int) string {
	if num > 0 {
		return "Positivo"
	} else if num < 0 {
		return "Negativo"
	}
	return "Zero"
}
func main() {
	var num int
	fmt.Print("Digite um número inteiro: ")
	_, err := fmt.Scanf("%d", &num)
	if err != nil {
		fmt.Println("Entrada inválida. Certifique-se de digitar um inteiro.")
		return
	}
	fmt.Println("Classificação:", classificar_numero(num))
}
