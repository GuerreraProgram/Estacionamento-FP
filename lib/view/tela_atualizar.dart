import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estacionamento/controller/login_controller.dart';
import 'package:flutter_estacionamento/controller/usuario_controller.dart';
import 'package:flutter_estacionamento/model/usuario.dart';

import 'erro.dart';

class TelaAtualizar extends StatefulWidget {
  const TelaAtualizar({Key? key}) : super(key: key);

  @override
  State<TelaAtualizar> createState() => _TelaAtualizarState();
}

class _TelaAtualizarState extends State<TelaAtualizar> {
  var txtNomeNovo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ATUALIZAR NOME'),
        backgroundColor: Colors.indigoAccent.shade700,
      ),
      body: Container(
        color: Colors.lightBlue[100],
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'ATUALIZAR NOME',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextField(
                        controller: txtNomeNovo,
                        decoration: InputDecoration(
                          labelText: 'Nome novo',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: 
                        ElevatedButton(
                          onPressed: () {
                            var u = Usuario(
                              LoginController().idUsuario(),
                              txtNomeNovo.text
                              );

                            UsuarioController().atualizar(context, LoginController().idUsuario(), u);
                          },
                          child: Text('Atualizar nome'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  mensagem(msg, cor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: cor,
    ));
  }
}
