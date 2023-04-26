import 'package:flutter/material.dart';
import 'package:flutter_estacionamento/view/tela_cadastro.dart';
import 'package:flutter_estacionamento/view/tela_recuperar.dart';

import '../model/usuario.dart';

//
// STATEFUL (stf+TAB)
//
class TelaRecuperar extends StatefulWidget {
  const TelaRecuperar({super.key});

  @override
  State<TelaRecuperar> createState() => _TelaRecuperarState();
}

class _TelaRecuperarState extends State<TelaRecuperar> {
  //Declaração dos Atributos
  List<Usuario> lista = [];
  var index;
  var txtEmail = TextEditingController();
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
        title: Text('RECUPERAR SENHA'),
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
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                //EVENTO DE PRESSIONAMENTO DO BOTÃO
                if (txtEmail.text.isNotEmpty) {
                  //ALTERAÇÃO DO ESTADO DA LISTA
                  Navigator.pushNamed(
                    context,
                      't0',
                      
                    );
                  } else {
                  mensagem(
                  'O campo de email não pode estar vazio.',
                  Colors.redAccent.shade100,
                  );
                    
                  }

                  txtEmail.clear();
                },
              child: Text('Enviar Recuperação'),
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