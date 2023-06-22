import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/usuario.dart';
import '../view/erro.dart';
import 'login_controller.dart';

class UsuarioController {
  void atualizar(context, id, Usuario t) {
                              FirebaseFirestore.instance
                              .collection('usuarios')
                              .doc(id)
                              .update(t.toJson())
                              .then((value) => sucesso(context, 'Nome atualizada com sucesso'))
                              .catchError(
                                  (e) => erro(context, 'Não foi possível atualizar o nome.'))
                              .whenComplete(() => Navigator.pop(context));
                            }
}