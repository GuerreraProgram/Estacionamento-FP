import 'package:flutter/material.dart';
import 'package:flutter_estacionamento/view/tela_cadastro.dart';
import 'package:flutter_estacionamento/view/tela_listagem.dart';
import 'package:flutter_estacionamento/view/tela_recuperar.dart';
import 'package:flutter_estacionamento/view/tela_sobre.dart';
import 'package:flutter_estacionamento/view/tela_menu.dart';

import 'view/tela_login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Estacionamento FP',

    //
    // ROTAS DE NAVEGAÇÃO
    //
    initialRoute: 't0',
    routes: {
      't0': (context) => TelaLogin(),
      't1': (context) => TelaCadastro(),
      't2': (context) => TelaRecuperar(),
      't3': (context) => TelaSobre(),
      't4': (context) => TelaMenu(),
      't5': (context) => TelaListar(),

    },
  ));
}