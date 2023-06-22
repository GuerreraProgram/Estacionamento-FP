import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/carro.dart';
import '../view/erro.dart';
import 'login_controller.dart';

class CarroController {
  //
  // ADICIONAR um carro na Coleção
  //
  void adicionar(context, Carro u) {
    FirebaseFirestore.instance
        .collection('carros')
        .add(u.toJson())
        .then((value) => sucesso(context, 'Carro adicionado com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.pop(context));
  }

  //
  // LISTAR
  //
  Stream<List<Carro>> listar() {
    return FirebaseFirestore.instance
        .collection('carros')
        .where('uid', isEqualTo: LoginController().idUsuario())
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Carro.fromJson(doc.data())).toList());
  }

  //
  // ATUALIZAR
  //
  void atualizar(context, uid, Carro t) {
    FirebaseFirestore.instance
        .collection('carros')
        .doc(uid)
        .set(t.toJson())
        .then((value) => sucesso(context, 'Carro atualizado com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível atualizar o carro.'))
        .whenComplete(() => Navigator.pop(context));
  }


  //
  // EXCLUIR
  //
  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('carros')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Carro excluído com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir o carro.'));
  }

  void editar(Carro carro) {}
}
