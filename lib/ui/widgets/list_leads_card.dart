import 'package:flutter/material.dart';
import 'package:wswork_app/ui/widgets/lead_card.dart';

class ListLeadsCard extends StatefulWidget {
  const ListLeadsCard({Key? key}) : super(key: key);

  @override
  State<ListLeadsCard> createState() => _ListLeadsCardState();
}

class _ListLeadsCardState extends State<ListLeadsCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: LeadCard(),
        );
      },
    );
  }
}
