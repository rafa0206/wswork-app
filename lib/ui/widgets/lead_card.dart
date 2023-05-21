import 'package:flutter/material.dart';
import 'package:wswork_app/entities/lead.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';

//ignore: must_be_immutable
class LeadCard extends StatelessWidget {
  Lead lead;

  LeadCard({
    Key? key,
    required this.lead,
    // this.operationStock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: CarsAppTheme.mainGrey,
        ))),
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 16, bottom: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 'NOME DO CARRO',
                      lead.name,
                      style: const TextStyle(
                          // color: Color(0xff555353),
                          color: CarsAppTheme.mainDarkGrey,
                          fontFamily: 'SF-Mono',
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'COMPRA',
                      style: TextStyle(
                          color: Color(0xff949191),
                          fontFamily: 'SF-Mono',
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    lead.date,
                    // '18/05/2023',
                    style: const TextStyle(
                        // color: Color(0xff58355E),
                        color: CarsAppTheme.mainBlue,
                        fontFamily: 'SF-Mono',
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lead.time,
                    // '17:25',
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SF-Mono',
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
