import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/models/livro.dart';
import 'pages/home_page.dart';
import 'pages/cadastro_page.dart';
import 'data/repositories/estante.dart';
import 'core/theme/theme1.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LivroAdapter());
  await Hive.openBox<Livro>(Estante.boxName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/cadastro': (context) => CadastroPage(),
      },
    );
  }
}
