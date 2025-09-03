use std::io;

fn eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    let mut entrada = String::new();

    let escolha_j1: String;

    loop {
        entrada.clear();
        println!("Jogador 1, escolha 'par' ou 'impar':");

        io::stdin()
            .read_line(&mut entrada)
            .expect("Falha ao ler entrada");

        let temp = entrada.trim().to_lowercase();

        if temp == "par" || temp == "impar" {
            escolha_j1 = temp;
            break;
        } else {
            println!("Escolha inválida. Digite exatamente 'par' ou 'impar'.");
        }
    }

    let numero_j1: i32;

    loop {
        entrada.clear();
        println!("Jogador 1: digite seu número (i32):");

        io::stdin()
            .read_line(&mut entrada)
            .expect("Falha ao ler entrada");

        match entrada.trim().parse::<i32>() {
            Ok(n) => {
                numero_j1 = n;
                break;
            }
            Err(_) => println!("Por favor, digite um número válido."),
        }
    }

    let numero_j2: i32;

    loop {
        entrada.clear();
        println!("Jogador 2: digite seu número (i32):");

        io::stdin()
            .read_line(&mut entrada)
            .expect("Falha ao ler entrada");

        match entrada.trim().parse::<i32>() {
            Ok(n) => {
                numero_j2 = n;
                break;
            }
            Err(_) => println!("Por favor, digite um número válido."),
        }
    }

    let soma = numero_j1 + numero_j2;
    println!("Soma: {}", soma);

    let soma_eh_par = eh_par(soma);

    if soma_eh_par {
        println!("A soma é par.");
    } else {
        println!("A soma é ímpar.");
    }

    if (soma_eh_par && escolha_j1 == "par") || (!soma_eh_par && escolha_j1 == "impar") {
        println!("Jogador 1 venceu");
    } else {
        println!("Jogador 2 venceu");
    }

}
