import './itembiblioteca.dart';
import './livros.dart';
import './revistas.dart';
import './cliente.dart';

main(){

    var l1 = Livros(
        autor:'Autor1',
        isbn: '1',
        titulo: 'Livro1',
        ano: 2024,
        qntcopias: 9,
        preco_emprestimo: 15.00,
        preco_dia: 2.50
    ),
    l2 = Livros(
        autor:'Autor2',
        isbn: '2',
        titulo: 'Livro2',
        ano: 2025,
        qntcopias: 15,
        preco_emprestimo: 15.00,
        preco_dia: 2.50
    ),
    l3 = Livros(
        autor:'Autor3',
        isbn: '3',
        titulo: 'Livro3',
        ano: 2002,
        qntcopias: 6,
        preco_emprestimo: 15.00,
        preco_dia: 2.50
    );
    
    var r1 = Revistas(
        numero_edicao: 20,
        mes: 'Agosto',
        titulo: 'Revista1',
        ano: 2025,
        qntcopias: 3,
        preco_emprestimo: 5.00,
        preco_dia: 1.00
    ),
    r2 = Revistas(
        numero_edicao: 1,
        mes: 'Maio',
        titulo: 'Revista2',
        ano: 2026,
        qntcopias: 11,
        preco_emprestimo: 5.00,
        preco_dia: 1.00
    ),
    r3 = Revistas(
        numero_edicao: 3,
        mes: 'Fevereiro',
        titulo: 'Revista3',
        ano: 2026,
        qntcopias: 7,
        preco_emprestimo: 5.00,
        preco_dia: 1.00
    );

    var c1 = Cliente(
        nome: 'Matheus',
        cpf: '123.456.789-00',
        email: 'matheus@gmail.com'
    ),
    c2 = Cliente(
        nome: 'Leonardo',
        cpf: '000.000.000-00',
        email: 'leo@gmail.com'
    );

    List<ItemBiblioteca> itens = [l1, l2, l3, r1, r2, r3];
    ItemBiblioteca.estoque.addAll(itens);
    
}