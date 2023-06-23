import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estacionamento/view/tela_cadastro.dart';
import 'package:flutter_estacionamento/view/tela_recuperar.dart';

import '../controller/login_controller.dart';
import '../view/erro.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
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
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.indigoAccent.shade700,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'ESTACIONAMENTO FP',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            adicionar(context),
          ],
        ),
      ),
    );
  }

  Widget adicionar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          TextField(
            controller: txtEmail,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: txtSenha,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
              prefixIcon: Icon(Icons.password),
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200, 40),
            ),
            onPressed: () {
              login(context, txtEmail.text, txtSenha.text);
            },
            child: Text('Entrar'),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 't2');
            },
            child: Text(
              'Recuperar senha',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
                color: Colors.lightBlue[200],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 't1');
            },
            child: Text(
              'Cadastro',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
                color: Colors.lightBlue[200],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 't3');
            },
            child: Text(
              'Sobre',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
                color: Colors.lightBlue[200],
              ),
            ),
          ),
        ],
      ),
    );
  }

  login(BuildContext context, String email, String senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      sucesso(context, 'Usuário autenticado com sucesso.');
      Navigator.pushReplacementNamed(context, 't4');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        case 'wrong-password':
          erro(context, 'Senha incorreta.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }

  mensagem(BuildContext context, String msg, Color cor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: cor,
    ));
  }
}
