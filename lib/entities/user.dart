import 'package:wswork_app/entities/lead.dart';

class User {
  int? id;
  String name;
  String email;
  String password;
  String phone;
  Lead? lead;

  User({
    /*required*/ this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.lead,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: (json['id'] as num).toInt(),
      name: (json['nome'] as String),
      email: (json['email'] as String),
      password: (json['senha'] as String),
      phone: (json['telefone'] as String),
      lead: Lead.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nome': name,
      'email': email,
      'senha': password,
      'telefone': phone,
    };
  }

}
