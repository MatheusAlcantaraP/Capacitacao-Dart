import './itembiblioteca.dart';

class Revistas extends ItemBiblioteca{
    int numero_edicao;
    String mes;

    Revistas({
        required this.numero_edicao, 
        required this.mes, 
        required super.titulo,
        required super.ano, 
        required super.qntcopias, 
        required super.preco_emprestimo, 
        required super.preco_dia
        });
}