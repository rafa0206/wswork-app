class Lead {
  int? userId;
  int? id;
  String? name;
  String? date;
  String? time;

  Lead({
    this.userId,
    this.id,
    this.name,
    this.date,
    this.time,
  });

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      userId: (json['id_usuario'] as num).toInt(),
      id: (json['id_compra'] as num).toInt(),
      name: (json['nome_compra'] as String),
      date: (json['data_compra'] as String),
      time: (json['horario_compra'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id_usuario': userId,
      'id_compra': id,
      'nome_compra': name,
      'data_compra': date,
      'horario_compra': time,
    };
  }
}
