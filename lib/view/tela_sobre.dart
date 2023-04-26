import 'package:flutter/material.dart';

import 'widget_devs.dart';

//
// Tela Principal
// stl+TAB
class TelaSobre extends StatelessWidget {
  const TelaSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BARRA DE TÍTULO
      appBar: AppBar(
        title: Text('SOBRE'),
        backgroundColor: Colors.indigoAccent.shade700,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
            'Tema escolhido foi o de estacionamento por usarmos no dia a dia na UNAERP.',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Objetivo é criar uma conta para a pessoa administrar o movimento das pessoas no estacionamento.',
            style: TextStyle(fontSize: 24),
          ),
            WidgetDev('Felipe Guerrera', '834.516', 'lib/images/Guerrera.jpg'),
            WidgetDev('Pedro Tonhão Sylos', '834.500', 'lib/images/Tonhão.jpg'),
          ],
        ),
      ),
    );
  }
}