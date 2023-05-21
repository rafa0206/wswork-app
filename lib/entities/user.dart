class User {
  int? id;
  String name;
  String email;
  String password;
  String phone;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: (json['id'] as num).toInt(),
      name: (json['nome'] as String),
      email: (json['email'] as String),
      password: (json['senha'] as String),
      phone: (json['telefone'] as String),
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
