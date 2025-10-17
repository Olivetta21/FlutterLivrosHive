import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/models/livro.dart';
import '../data/repositories/estante.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Livros cadastrados")),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Menu'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Página Inicial'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Cadastro'),
              onTap: () {
                Navigator.pushNamed(context, '/cadastro');
              },
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder (
        valueListenable: Hive.box<Livro>(Estante.boxName).listenable(),
        builder: (context, box, _) {
          final livros = box.values.toList();
          return ListView.builder(
            itemCount: livros.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(livros[index].titulo),
                subtitle: Text(livros[index].autor),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Clicou no ${livros[index].titulo}')),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/cadastro'),
        child: const Icon(Icons.add),
        tooltip: 'Cadastrar livro',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
