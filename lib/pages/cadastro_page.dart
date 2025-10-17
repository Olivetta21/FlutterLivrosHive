import 'package:flutter/material.dart';
import '../data/models/livro.dart';
import '../data/repositories/estante.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {  
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de livro")),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Titulo'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Titulo do Livro';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _authorController,
              decoration: InputDecoration(labelText: 'Autor'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Autor do Livro';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final livro = Livro(
                    _titleController.text,
                    _authorController.text,
                    0,
                    '',
                  );
                  await Estante.addLivro(livro);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(
                      'salvo: ${livro.titulo} por ${livro.autor}'
                    )),
                  );

                  _titleController.clear();
                  _authorController.clear();
                  Navigator.pushNamed(context, '/');
                }
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}