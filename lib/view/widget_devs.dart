import 'package:flutter/material.dart';

class WidgetDev extends StatelessWidget {
  //Atributos
  final String marca;
  final String modelo;
  final String foto;

  const WidgetDev(this.marca, this.modelo, this.foto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //Margin = distâncias externas
      //margin: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),

      //Padding = distâncias internas
      padding: EdgeInsets.all(20),

      width: MediaQuery.of(context).size.width,
      height: 420,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            marca,
          ),
          Text(
            modelo,
          ),
          Image.asset(
            foto,
            width: MediaQuery.of(context).size.width * 0.12,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}