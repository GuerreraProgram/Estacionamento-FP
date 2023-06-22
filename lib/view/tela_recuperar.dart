import 'package:flutter/material.dart';

import '../controller/login_controller.dart';

class TelaRecuperar extends StatefulWidget {
  const TelaRecuperar({Key? key}) : super(key: key);

  @override
  State<TelaRecuperar> createState() => _TelaRecuperarState();
}

class _TelaRecuperarState extends State<TelaRecuperar> {
  var txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RECUPERAR SENHA'),
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
                      'RECUPERAR SENHA',
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
                                controller: txtEmail,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
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
                              LoginController().esqueceuSenha(
                                context,
                                txtEmail.text,
                              );
                            },
                            child: Text('Enviar Recuperação'),
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
