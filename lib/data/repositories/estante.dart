import 'package:hive/hive.dart';
import '../models/livro.dart';


class Estante {
  static const String boxName = 'estanteBox';

  static Future<void> addLivro(Livro livro) async {
    final box = await Hive.openBox<Livro>(boxName);
    await box.add(livro);
  }

  static Future<List<Livro>> getLivros() async {
    final box = await Hive.openBox<Livro>(boxName);
    return box.values.toList();
  }

  static Future<void> deleteLivro(int index) async {
    final box = await Hive.openBox<Livro>(boxName);
    await box.deleteAt(index);
  }

  static Future<void> updateLivro(int index, Livro livro) async {
    final box = await Hive.openBox<Livro>(boxName);
    await box.putAt(index, livro);
  }

}
