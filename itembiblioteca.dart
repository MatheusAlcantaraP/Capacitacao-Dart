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
    static List<ItemBiblioteca> estoque = [];

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

    // Método para realizar a devolução de livros e revistas
    void devolver(Cliente cliente){
        // Variável booleana para verificar se existe qualquer empréstimo desse item para esse cliente
        bool existeEmprestimo = emprestimos.any((emp) => emp.cliente == cliente);

        if(existeEmprestimo == false){
            print('Não há empréstimos desse livro no nome deste cliente.\n');
            return;
        }

        // Encontra o primeiro empréstimo desse item que esteja no nome do cliente em questão
        var emprestimoAtual = emprestimos.firstWhere((emp) => emp.cliente == cliente);

        print('Insira a data da devolução do item ${titulo} emprestada para o cliente ${cliente.nome}: (AAAA-MM-DD)');
        String? entrada;
        entrada = stdin.readLineSync();

        // Verifica se a entrada não é null
        if(entrada != null){
            try{
                // Atribui a entrada da data (String) para uma variável do tipo DateTime
                DateTime data = DateTime.parse(entrada);
                
                // Calcula a quantidade de dias em que o item esteve emprestado
                int dias = data.difference(emprestimoAtual.dataEmprestimo).inDays;

                // Verifica se a data informada é uma data correta, não podendo ser anterior a data informada no empréstimo
                while(dias < 0){
                    print('Data inválida! A data de devolução não pode ser anterior a data de empréstimo');
                    entrada = stdin.readLineSync();
                    if (entrada != null) {
                        data = DateTime.parse(entrada);
                        dias = data.difference(emprestimoAtual.dataEmprestimo).inDays;
                    }
                    else{
                        return;
                    }
                };

                // Por padrão, adotei que um cliente deve devolver o item em até 14 dias da data do empréstimo
                dias = dias - 14; 
                double valorTotal;
                
                // Calcula o valor total
                if(dias > 0){
                    valorTotal = (dias * preco_dia) + preco_emprestimo;
                }
                else{
                    valorTotal = preco_emprestimo;
                    dias = 0;
                }
                
                // Devolve o livro emprestado e remove da lista de empréstimos 
                qntcopias += 1;
                emprestimos.remove(emprestimoAtual);
                print('===============================================================');
                print('A devolução do item:\nTÍTULO: ${titulo}\nANO DE LANÇAMENTO: ${ano}\nCÓPIAS NO ESTOQUE: ${qntcopias}\nPREÇO DO EMPRÉSTIMO: R\$${preco_emprestimo}\nPREÇO POR DIA DE MULTA: R\$${preco_dia}\n\nFoi realizada com sucesso na data ${data.toString().split(' ')[0]} pelo cliente ${cliente.nome}!');
                print('Quantidade de dias multados: ${dias}');
                print('Valor total: R\$${valorTotal}');
                print('===============================================================');
            }
            catch(e){
                // Caso tenha algum erro com a data aborta o método com return
                print('Ocorreu um erro inesperado $e\n');
                return;
            }
        }
    }

    // Método para listar todos os livros e revistas no estoque 
    static void listarLivros(){
        // Verifica se o estoque não está vázio
        if(estoque.isEmpty){
            print('O estoque de livros da biblioteca está sem nenhum livro!');
            return;
        }
        print('-----------ESTOQUE-----------');
        
        // Percorre a lista do estoque e imprime os detalhes de todos os itens
        for (var livros in estoque){
            print('TITULO: ${livros.titulo}\nANO: ${livros.ano}\nCÓPIAS NO ESTOQUE: ${livros.qntcopias}\nPREÇO POR EMPRÉSTIMO: ${livros.preco_emprestimo}\nPREÇO POR DIA DE MULTA: ${livros.preco_dia}\n');
        }

    }
}