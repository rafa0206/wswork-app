import 'dart:convert';
import 'dart:io';

import 'package:wswork_app/entities/car.dart';
import 'package:http/http.dart' as http;

class CarApi {
  static final CarApi instance = CarApi._();

  CarApi._();

  Future<List<Car>?> getCars() async {
    List<Car>? cars;
    try {
      final response = await http.get(
        Uri.parse('https://wswork.com.br/cars.json'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      if (response.statusCode != 200) {
        print("LOG[CarApi.getCars] - status != 200");
        return null;
      }

      var responseData = json.decode(utf8.decode(response.bodyBytes));
      print('responseData: $responseData');
      cars = (responseData as List).map((json) {
        return Car.fromJson(json as Map<String, dynamic>);
      }).toList();

      print(cars);
      return cars;
    } on Exception catch (error) {
      print("LOG[CarApi.getCars] - error $error");
      return null;
    }
    return null;
  }
}
