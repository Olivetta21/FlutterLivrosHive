import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/livro.dart';
import 'pages/home_page.dart';
import 'pages/cadastro_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LivroAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/cadastro': (context) => CadastroPage(),
      },
      );
  }
}
