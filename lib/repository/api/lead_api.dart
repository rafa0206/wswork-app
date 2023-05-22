import 'dart:convert';
import 'dart:io';

import 'package:wswork_app/entities/lead.dart';
import 'package:http/http.dart' as http;

class LeadApi {
  static final LeadApi instance = LeadApi._();

  LeadApi._();

  // Future<String?> addLead(Lead lead) async {
  Future<void> addLead(Lead lead) async {
    var encode = json.encode(lead.toJson());

    try {
      final response = await http.post(
        Uri.parse('https://www.wswork.com.br/cars/leads/'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: encode,
      );

      if (response.statusCode != 200) {
        return null;
      }

      return;
      // return 'Boas compras';
    } on Exception catch (error) {
      print("LOG[LeadApi.addLead] - error $error");
      return null;
    }
  }
}
