import 'package:flutter/material.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';

class LeadCard extends StatelessWidget {
  // OperationStock operationStock;

  const LeadCard({
    super.key,
    // this.operationStock,
  });

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
        child: const Padding(
          padding: EdgeInsets.only(left: 28, right: 16, bottom: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NOME DO CARRO',
                      // '${operationStock.name}',
                      style: TextStyle(
                          // color: Color(0xff555353),
                          color: CarsAppTheme.mainDarkGrey,
                          fontFamily: 'SF-Mono',
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 4),
                    Text(
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
                    // '${operationStock.date}',
                    '18/05/2023',
                    style: TextStyle(
                        // color: Color(0xff58355E),
                        color: CarsAppTheme.mainBlue,
                        fontFamily: 'SF-Mono',
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 4),
                  Text(
                    // '${operationStock.time}',
                    '17:25',
                    style: TextStyle(
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
