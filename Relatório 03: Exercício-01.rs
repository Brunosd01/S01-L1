use std::io;

fn verificar_senha(senha: &str) -> bool {
    if senha.chars().count() < 8 {
        return false;
    }

    let mut has_digit = false;
    let mut has_upper = false;

    for c in senha.chars() {
        if c.is_digit(10) {
            has_digit = true;
        }
        if c.is_ascii_uppercase() {
            has_upper = true;
        }

        if has_digit && has_upper {
            break;
        }
    }

    has_digit && has_upper
}

fn main() {
    println!("digite a senha:");

    let mut entrada = String::new();

    loop {
        entrada.clear();
        
        io::stdin()
            .read_line(&mut entrada)
            .expect("Falha ao ler entrada");

        let senha = entrada.trim();
        
        if verificar_senha(senha) {
            println!("Senha correta! Acesso concedido.");
            break;
        } else {
            println!("Senha inválida.");
            println!("Digite a senha novamente:");
        }
    }
}
