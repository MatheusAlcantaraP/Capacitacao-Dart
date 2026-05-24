import './cliente.dart';
import './itembiblioteca.dart';

class Emprestimo{
    Cliente cliente;
    ItemBiblioteca itembiblioteca;
    DateTime dataEmprestimo;

    Emprestimo({
        required this.cliente,
        required this.itembiblioteca,
        required this.dataEmprestimo
        });
}