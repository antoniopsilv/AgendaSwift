import Foundation

// Função para exibir o menu principal
func exibirMenu() {
    print("\nMenu de Cadastro")
    print("1. Incluir")
    print("2. Alterar")
    print("3. Consultar")
    print("4. Exibir")
    print("5. Excluir")
    print("6. Sair")
}

// Função para incluir um novo cadastro
func incluirCadastro(dicionario: inout [String: [String]]) {

    // Solicitar dados do usuário
    print("Digite o nome: ", terminator: "")
    let nome = readLine() ?? ""
    
    // Verificar se o nome já existe no dicionário
    if dicionario[nome] != nil {
        print("Já existe um cadastro com esse nome!")
        return
    }
    
    // Solicitar e-mail, telefone e idade
    print("E-mail: ", terminator: "")
    let email = readLine() ?? ""
    
    print("Telefone: ", terminator: "")
    let telefone = readLine() ?? ""
    
    print("Idade: ", terminator: "")
    let idade = readLine() ?? ""
    
    // Inserir os dados no dicionário
    dicionario[nome] = [email, telefone, idade]
    
    // Exibir os dados inseridos
    print("\nCadastro inserido com sucesso!")
    print(dicionario)
}

// Função para alterar um cadastro existente
func alterarCadastro(dicionario: inout [String: [String]]) {


    print("Digite o nome: ", terminator: "")
    let nome = readLine() ?? ""
    
    // Verifica se o nome existe no dicionário
    if let dados = dicionario[nome] {

        print("Dados do cadastro:")
        print("\(nome)")
        print((dados[0]))
        print((dados[1]))
        print((dados[2]))
        print("\n")
        
        
        // Solicitando os novos dados
        print("Digite o novo nome: ", terminator: "")
        let novoNome = readLine() ?? ""
        
        print("Digite o novo e-mail: ", terminator: "")
        let novoEmail = readLine() ?? ""
        
        print("Digite o novo telefone: ", terminator: "")
        let novoTelefone = readLine() ?? ""
        
        print("Digite a nova idade: ", terminator: "")
        let novaIdade = readLine() ?? ""
        
        // Atualiza os dados
        dicionario.removeValue(forKey: nome)  // Remove o antigo cadastro
        dicionario[novoNome] = [novoEmail, novoTelefone, novaIdade]
        
        print("Cadastro alterado com sucesso!")
        print(dicionario)
    } else {
        print("Cadastro não encontrado!")
    }
}
    

// Função para alterar um cadastro existente
func consultaExibirCadastro(dicionario: inout [String: [String]]) {

    print("Digite o nome a ser consultado: ", terminator: "")
    let nome = readLine() ?? ""
    
    // Verifica se o nome existe no dicionário
    if let dados = dicionario[nome] {

        print("Dados do cadastro:")
        print((nome))
        print((dados[0]))
        print((dados[1]))
        print((dados[2]))
        print("\n")

                // Perguntar se deseja continuar
        print("\nDeseja consultar outro cadastro? (S/N): ", terminator: "")
        if let resposta = readLine()?.uppercased(), resposta == "N" {
            exibirMenu()
        } else {
            var cadastro = [String: [String]]()
            consultaExibirCadastro(dicionario: &cadastro)
        }
        
    } else {
        print("Cadastro não encontrado!")

        print("\nDeseja consultar outro cadastro? (S/N): ", terminator: "")
        if let resposta = readLine()?.uppercased(), resposta == "N" {
            exibirMenu()
        } else {
            var cadastro = [String: [String]]()
            consultaExibirCadastro(dicionario: &cadastro)
        }
    }
}

// Função para alterar um cadastro existente
func exibirTodosCadastros(dicionario: inout [String: [String]]) {
    print(dicionario)
}


// Função para alterar um cadastro existente
func apagaCadastro(dicionario: inout [String: [String]]) {

    print("Digite o nome do cadastro a ser apagado: ", terminator: "")
    let nome = readLine() ?? ""
    
    if dicionario[nome] != nil {
        // Apaga o cadastro 
        dicionario.removeValue(forKey: nome)  // Remove o antigo cadastro
        
        print("Cadastro apagado com sucesso!")
        print(dicionario)
    } else {
        print("Cadastro não encontrado!")
    }
}

// Função principal
func executarPrograma() {
    // Dicionário que irá armazenar os dados
    var cadastro = [String: [String]]()
    
    // Loop para o menu de opções
    var continuar = true
    while continuar {
        exibirMenu()
        if let opcao = readLine() {
            switch opcao {
            case "1":
                incluirCadastro(dicionario: &cadastro)
            case "2":
                alterarCadastro(dicionario: &cadastro)
            case "3":
                consultaExibirCadastro(dicionario: &cadastro)
            case "4":
                exibirTodosCadastros(dicionario: &cadastro)            
            case "5":
                apagaCadastro(dicionario: &cadastro)
            case "6":
                continuar = false
            default:
                print("Opção inválida!")
            }
        }       
    }
    
    print("\nPrograma finalizado.")
}

// Iniciar o programa
executarPrograma()

