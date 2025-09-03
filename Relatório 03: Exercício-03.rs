use std::io;

fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    for i in limite_inferior..=limite_superior {
        println!("{} x {} = {}", numero, i, numero * i);
    }
}

fn main() {
    println!("--- Imprimir Tabuada ---");

    let mut entrada = String::new();

    let numero: i32;
    loop {
        entrada.clear();
        println!("Digite o número da tabuada (i32):");

        io::stdin()
            .read_line(&mut entrada)
            .expect("Falha ao ler entrada");

        match entrada.trim().parse::<i32>() {
            Ok(n) => {
                numero = n;
                break;
            }
            Err(_) => println!("Por favor, digite um número inteiro válido."),
        }
    }

    let limite_inferior: i32;
    loop {
        entrada.clear();
        println!("Digite o limite inferior (i32):");

        io::stdin()
            .read_line(&mut entrada)
            .expect("Falha ao ler entrada");

        match entrada.trim().parse::<i32>() {
            Ok(n) => {
                limite_inferior = n;
                break;
            }
            Err(_) => println!("Por favor, digite um número inteiro válido."),
        }
    }

    let limite_superior: i32;
    loop {
        entrada.clear();
        println!("Digite o limite superior (i32):");

        io::stdin()
            .read_line(&mut entrada)
            .expect("Falha ao ler entrada");

        match entrada.trim().parse::<i32>() {
            Ok(n) => {
                limite_superior = n;
                break;
            }
            Err(_) => println!("Por favor, digite um número inteiro válido."),
        }
    }

    let (li, ls) = if limite_inferior <= limite_superior {
        (limite_inferior, limite_superior)
    } else {
        println!("Aviso: limite inferior maior que limite superior. Invertendo os limites.");
        (limite_superior, limite_inferior)
    };

    println!("Tabuada de {} de {} até {}:", numero, li, ls);
    imprimir_tabuada(numero, li, ls);
}
