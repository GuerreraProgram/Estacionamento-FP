import 'package:uuid/uuid.dart';

class Carro {
  final String uid;
  final String cor;
  final String marca;
  final String modelo;
  final String placa;

Carro({
    String? uid,
    required this.cor,
    required this.marca,
    required this.modelo,
    required this.placa,
  }) : uid = uid ?? Uuid().v4();

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'cor': cor,
      'marca': marca,
      'modelo': modelo,
      'placa': placa
    };
  }

  factory Carro.fromJson(Map<String, dynamic> json) {
  return Carro(
    uid: json['uid'],
    cor: json['cor'],
    marca: json['marca'],
    modelo: json['modelo'],
    placa: json['placa'],
  );
}
}
