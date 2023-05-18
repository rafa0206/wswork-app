import 'package:wswork_app/entities/car.dart';
import 'package:wswork_app/entities/user.dart';

class Lead {
  int id;
  int userId;
  int carId;
  String name;
  String date;
  String time;
  Car car;
  User user;

  Lead({
    required this.id,
    required this.userId,
    required this.carId,
    required this.name,
    required this.date,
    required this.time,
    required this.car,
    required this.user,
  });

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      id: (json['id'] as num).toInt(),
      userId: (json['id'] as num).toInt(),
      carId: (json['id'] as num).toInt(),
      name: (json['nome'] as String),
      date: (json['data'] as String),
      time: (json['horario'] as String),
      car: Car.fromJson(json),
      user: User.fromJson(json),
      // product: Product.fromJsonDB(json, idDeletedProduct: idDeletedProduct),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      // 'id_usuario': userId,
      // 'id_carro': carId,
      'id_usuario': user.id,
      'id_carro': car.id,
      'nome': name,
      'data': date,
      'horario': time,
    };
  }
}
