package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)
func verificarLogin(usuario, senha string) bool {
	const usuarioCorreto = "senha"
	const senhaCorreta = "admin"

	if usuario == usuarioCorreto && senha == senhaCorreta {
		return true
	}
	return false
}

func main() {
	reader := bufio.NewReader(os.Stdin)

	for {
		fmt.Print("Usuário: ")
		usuario, _ := reader.ReadString('\n')
		fmt.Print("Senha: ")
		senha, _ := reader.ReadString('\n')

		usuario = strings.TrimSpace(usuario)
		senha = strings.TrimSpace(senha)

		if verificarLogin(usuario, senha) {
			fmt.Println("Login bem-sucedido!")
			break
		} else {
			fmt.Println("Usuário ou senha incorretos. Tente novamente.")
		}
	}
}
