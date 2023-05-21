import 'package:flutter/material.dart';
import 'package:wswork_app/ui/widgets/list_leads_card.dart';

class LeadsPage extends StatefulWidget {
  const LeadsPage({Key? key}) : super(key: key);

  @override
  State<LeadsPage> createState() => _LeadsPageState();
}

class _LeadsPageState extends State<LeadsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'COMPRAS',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF-Mono',
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 60),
        child: ListLeadsCard(),
      ),
    );
  }
}
