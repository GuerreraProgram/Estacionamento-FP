class Usuario {
  final String uid;
  final String nome;

  Usuario(this.uid, this.nome);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'nome': nome
    };
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      json['uid'],
      json['nome']
    );
  }
}