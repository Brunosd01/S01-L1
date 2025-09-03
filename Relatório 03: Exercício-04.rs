use std::io;

fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let soma_pesos = 2.0 + 3.0 + 5.0; // = 10.0
    let soma_ponderada = nota1 * 2.0 + nota2 * 3.0 + nota3 * 5.0;
    soma_ponderada / soma_pesos
}

fn main() {
    println!("--- Exercício 04: Média Ponderada ---");

    let mut entrada = String::new();

    println!("Digite a primeira nota:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler nota1");
    let nota1: f64 = entrada.trim().parse().expect("Digite um número válido");

    println!("Digite a segunda nota:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler nota2");
    let nota2: f64 = entrada.trim().parse().expect("Digite um número válido");

    println!("Digite a terceira nota:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler nota3");
    let nota3: f64 = entrada.trim().parse().expect("Digite um número válido");

    let media = calcular_media(nota1, nota2, nota3);

    println!("Média ponderada: {:.2}", media);

    if media >= 7.0 {
        println!("Aprovado");
    } else {
        println!("Reprovado");
    }
}
