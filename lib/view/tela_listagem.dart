import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_estacionamento/model/usuario.dart';

class TelaListar extends StatefulWidget {
  const TelaListar({super.key});

  @override
  State<TelaListar> createState() => _TelaListarState();
}

class _TelaListarState extends State<TelaListar> {
  //Declaração dos Atributos
  List<Usuario> lista = [];
  var index;
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtCarro = TextEditingController();
  var txtPlacaCarro = TextEditingController();
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
        title: Text('LISTAGEM DE USUÁRIOS'),
        backgroundColor: Colors.indigoAccent.shade700,
      ),
      //CORPO
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: adicionar(),
          ),
          Expanded(
            flex: 2,
            child: listar(),
          ),
        ],
      ),
      persistentFooterButtons: [
        Text('Total de Usuarios: ${lista.length.toString()}'),
      ],
    );
  }

  // ADICIONAR UsuarioS
  adicionar() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.blueGrey.shade50,
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
              controller: txtCarro,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Carro',
                labelStyle: TextStyle(fontSize: 12),
                icon: Icon(Icons.car_crash),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: txtPlacaCarro,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Placa do Carro',
                labelStyle: TextStyle(fontSize: 12),
                icon: Icon(Icons.car_crash),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                //EVENTO DE PRESSIONAMENTO DO BOTÃO
                if (txtNome.text.isNotEmpty && txtEmail.text.isNotEmpty && txtCarro.text.isNotEmpty && txtPlacaCarro.text.isNotEmpty) {
                  //ALTERAÇÃO DO ESTADO DA LISTA

                  if (index == -1) {
                    //Adicionar um novo Usuario
                    setState(() {
                      lista.add(Usuario(txtNome.text, txtEmail.text, txtCarro.text, txtPlacaCarro.text, txtSenha.text));
                    });
                    mensagem(
                      'Usuario adicionado com sucesso.',
                      Colors.blueAccent.shade100,
                    );
                  } else {
                    //Alterar um Usuario existente
                    setState(() {
                      lista[index] = Usuario(
                        txtNome.text,
                        txtEmail.text,
                        txtCarro.text,
                        txtPlacaCarro.text,
                        txtSenha.text,
                      );
                      index = -1;
                    });
                    mensagem(
                      'Usuario alterado com sucesso.',
                      Colors.blueAccent.shade100,
                    );
                  }

                  txtNome.clear();
                  txtEmail.clear();
                  txtCarro.clear();
                  txtPlacaCarro.clear();
                } else {
                  mensagem(
                    'Os campos nome, email, carro ou plpaca não podem ser vazios.',
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

  //LISTAR UsuarioS
  listar() {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.car_rental),
              title: Text(lista[index].nome),
              trailing: IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () {
                  setState(() {
                    lista.removeAt(index);
                  });
                  mensagem(
                    'Usuario removido com sucesso.',
                    Colors.blueAccent.shade100,
                  );
                },
              ),
              onTap: () {
                setState(() {
                  this.index = index;
                  txtNome.text = lista[index].nome;
                  txtEmail.text = lista[index].email;
                  txtCarro.text = lista[index].carro;
                  txtPlacaCarro.text = lista[index].placa;
                });
              },
              tileColor: (this.index == index)
                  ? Colors.blueAccent.shade100.withOpacity(0.2)
                  : Colors.white,
            ),
          );
        },
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