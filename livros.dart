import './itembiblioteca.dart';

class Livros extends ItemBiblioteca{
    String autor;
    String isbn;

    Livros({
        required this.autor, 
        required this.isbn, 
        required super.titulo,
        required super.ano, 
        required super.qntcopias, 
        required super.preco_emprestimo, 
        required super.preco_dia
        });
}