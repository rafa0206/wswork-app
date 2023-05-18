import 'package:flutter/material.dart';
import 'package:wswork_app/ui/widgets/car_card.dart';

class ListCarCards extends StatefulWidget {
  const ListCarCards({Key? key}) : super(key: key);

  @override
  State<ListCarCards> createState() => _ListCarCardsState();
}

class _ListCarCardsState extends State<ListCarCards> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: CarCard(),
          );
        },
    );
  }
}
