import 'package:hive/hive.dart';

part 'livro.g.dart';

@HiveType(typeId: 1)
class Livro {
  @HiveField(0)
  String titulo;

  @HiveField(1)
  String autor;
  
  @HiveField(2)
  int anoPublicacao;  
  
  @HiveField(3)
  String editora;

  Livro(this.titulo, this.autor, this.anoPublicacao, this.editora);
}