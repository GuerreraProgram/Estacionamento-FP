import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/usuario.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});
  

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  
  List<Usuario> lista = [];
  var index;
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtConfirmSenha = TextEditingController();
  var txtNome = TextEditingController();
  var txtCarro = TextEditingController();
  var txtPlacaCarro = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BARRA DE TÍTULO
      appBar: AppBar(
        title: Text('CADASTRO'),
        backgroundColor: Colors.indigoAccent.shade700,
      ),
      //CORPO
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: adicionar(),
          ),
        ],
      ),
    );
  }

  // ADICIONAR UsuarioS
  adicionar() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: txtNome,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(fontSize: 12),
                icon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: txtEmail,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(fontSize: 12),
                icon: Icon(Icons.people),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              obscureText: true,
              controller: txtSenha,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(fontSize: 12),
                icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              obscureText: true,
              controller: txtConfirmSenha,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Confirmar senha',
                labelStyle: TextStyle(fontSize: 12),
                icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                //EVENTO DE PRESSIONAMENTO DO BOTÃO
                if (txtEmail.text.isNotEmpty && txtSenha.text.isNotEmpty && txtConfirmSenha.text.isNotEmpty) {

                    mensagem(
                      'Usuario adicionado com sucesso.',
                      Colors.blueAccent.shade100,
                    );

                    Navigator.pushNamed(
                      context,
                      't0',
                      
                    );
                  }
                 else {
                  mensagem(
                    'Os campos nome, email, senha ou confirmação de senha não podem ser vazios.',
                    Colors.redAccent.shade100,
                  );
                }
              },
              child: Text('salvar'),
            ),
          ],
        ),
      ),
    );
  }
  mensagem(msg, cor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        //: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: cor,
    ));
  }
}