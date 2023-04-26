import 'package:flutter/material.dart';
import 'package:flutter_estacionamento/view/tela_cadastro.dart';
import 'package:flutter_estacionamento/view/tela_recuperar.dart';

import '../model/usuario.dart';

//
// STATEFUL (stf+TAB)
//
class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  //Declaração dos Atributos
  List<Usuario> lista = [];
  var index;
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  void initState() {
    index = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BARRA DE TÍTULO
      appBar: AppBar(
        title: Text('ESTACIONAMENTO FP'),
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
              controller: txtEmail,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(fontSize: 12),
                icon: Icon(Icons.person),
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
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                //EVENTO DE PRESSIONAMENTO DO BOTÃO
                if (txtEmail.text.isNotEmpty && txtSenha.text.isNotEmpty) {
                  //ALTERAÇÃO DO ESTADO DA LISTA

                  if (txtEmail == txtEmail && txtSenha == txtSenha) {
                    Navigator.pushNamed(
                      context,
                      't4',
                    );
                  }
                  
                } else {
                  mensagem(
                    'Os campos email e senha não podem ser vazios.',
                    Colors.redAccent.shade100,
                  );
                }
              },
              child: Text('Entrar'),
            ),
            TextButton(
                onPressed: () {Navigator.pushNamed(
                      context,
                      't2',
                      
                    );},
                child: Text('Recuperar senha', style: TextStyle(decoration: TextDecoration.underline), ),
              ),
              TextButton(
                onPressed: () {Navigator.pushNamed(
                      context,
                      't1',
                      
                    );},
                child: Text('Cadastro', style: TextStyle(decoration: TextDecoration.underline)),
              ),
              TextButton(
                onPressed: () {Navigator.pushNamed(
                      context,
                      't3',
                      
                    );},
                child: Text('Sobre', style: TextStyle(decoration: TextDecoration.underline), ),
              ),
          ],
        ),
      ),
    );
  }

  //Exibir Mensagem
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