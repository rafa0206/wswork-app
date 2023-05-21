// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wswork_app/entities/lead.dart';
import 'package:wswork_app/repository/local/lead_repository.dart';

class LeadModel extends ChangeNotifier{

  Future<List<Lead>?>? futureLeads;
  bool loading = false;

  static LeadModel of(BuildContext context) {
    // return Provider.of<CarModel>(context);
    return Provider.of<LeadModel>(context, listen: false);
  }

  Future<void> fetchLeads() async {
    loading = true;
    futureLeads = LeadRepository.instance.listAll();
    loading = false;
    notifyListeners();
  }

}