import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controller/carro_controller.dart';
import '../controller/login_controller.dart';
import '../model/carro.dart';
import '../view/erro.dart';

class TelaListar extends StatefulWidget {
  @override
  _TelaListarState createState() => _TelaListarState();
}

class _TelaListarState extends State<TelaListar> {
  var txtCor = TextEditingController();
  var txtMarca = TextEditingController();
  var txtModelo = TextEditingController();
  var txtPlaca = TextEditingController();
  String? docId;

  @override
  Widget build(BuildContext context) {
    final double textFieldWidth = MediaQuery.of(context).size.width * 0.75;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Carros'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: textFieldWidth,
                    child: TextField(
                      controller: txtCor,
                      decoration: InputDecoration(
                        labelText: 'Cor',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: textFieldWidth,
                    child: TextField(
                      controller: txtMarca,
                      decoration: InputDecoration(
                        labelText: 'Marca',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: textFieldWidth,
                    child: TextField(
                      controller: txtModelo,
                      decoration: InputDecoration(
                        labelText: 'Modelo',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: textFieldWidth,
                    child: TextField(
                      controller: txtPlaca,
                      decoration: InputDecoration(
                        labelText: 'Placa',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    child: Text("Salvar"),
                    onPressed: () {
                      Carro t = Carro(
                        uid: LoginController().idUsuario(),
                        cor: txtCor.text,
                        marca: txtMarca.text,
                        modelo: txtModelo.text,
                        placa: txtPlaca.text,
                      );

                      txtCor.clear();
                      txtMarca.clear();
                      txtModelo.clear();
                      txtPlaca.clear();

                      if (docId == null) {
                        CarroController().adicionar(context, t);
                        Navigator.pushNamed(context, 't5');
                      } else {
                        CarroController().atualizar(context, docId!, t);
                      }

                      setState(() {
                        docId = null;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('carros').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final documents = snapshot.data!.docs[index];
                        return Dismissible(
                          key: Key(documents.id),
                          onDismissed: (direction) {
                            CarroController().excluir(context, documents.id);
                          },
                          background: Container(
                            color: Colors.red,
                            child: Icon(Icons.delete, color: Colors.white),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Card(
                                color: Colors.lightBlue[200],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(color: Colors.blue[800]!, width: 2.0),
                                ),
                                child: Container(
                                  width: 300,
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Cor:', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text(documents['cor']),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Carro:', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text(documents['marca']),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Modelo:', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text(documents['modelo']),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Placa:', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text(documents['placa']),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
