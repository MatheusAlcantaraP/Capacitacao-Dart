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
}