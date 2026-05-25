import 'dart:io';
import './cliente.dart';
import './emprestimo.dart';

class ItemBiblioteca {
    // Atributos da classe ItemBiblioteca
    String titulo;
    int ano;
    int qntcopias; 
    double preco_emprestimo;
    double preco_dia;

    //Lista que vai guardar os empréstimos ativos da biblioteca
    List<Emprestimo> emprestimos = [];

    // Construtor da classe ItemBiblioteca
    ItemBiblioteca({
        required this.titulo,
        required this.ano, 
        required this.qntcopias, 
        required this.preco_emprestimo, 
        required this.preco_dia
        });

    // Método para realizar o empréstimo de livros e revistas
    void emprestar(Cliente cliente){
        // Verifica se há cópias disponíveis desse item para realizar o empréstimo
        if (qntcopias <= 0){
            print('Não há cópias disponíveis desse item para o empréstimo');
            return;
        }

        print('Insira a data do empréstimo do item ${titulo} que será emprestada para o cliente ${cliente.nome}: (AAAA-MM-DD)');
        String? entrada;
        entrada = stdin.readLineSync();

        // Verifica se a entrada não é null
        if(entrada != null){
            try{
                // Atribui a entrada da data (String) para uma variável do tipo DateTime
                DateTime data = DateTime.parse(entrada);
                
                // Cria um novo empréstimo no sistema e adiciona na lista 
                var novoEmprestimo = Emprestimo(cliente: cliente, itembiblioteca: this, dataEmprestimo: data);
                emprestimos.add(novoEmprestimo);

                qntcopias -= 1;
                
                print('O emprestimo do item ${titulo} foi realizado com sucesso na data ${data.toString().split(' ')[0]} pelo cliente ${cliente.nome}!\n');
            }
            // Caso tenha algum erro com a data aborta o método com return
            catch(e){
                print('Ocorreu um erro inesperado $e\n');
                return;
            }
        }
    }
}