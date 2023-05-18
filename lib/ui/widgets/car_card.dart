import 'package:flutter/material.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';

class CarCard extends StatelessWidget {
  const CarCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: CarsAppTheme.mainGrey,
      child: const Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon(
                //   (Icons.directions_car_filled_rounded),
                //   color: CarsAppTheme.mainBlue,
                //   size: 50,
                // ),
                // SizedBox(
                //   width: 10,
                // ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NOME do carro',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SF-Mono',
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Combustível: \n'
                          'Número de portas: \n'
                          'Valor Fipe: \n'
                          'Cor: ',
                      style: TextStyle(
                        color: CarsAppTheme.mainDarkGrey,
                        fontFamily: 'SF-Mono',
                        fontSize: 15,
                        // fontWeight: FontWeight.w700
                      ),
                    ),

                  ],
                ),
                Icon(
                  (Icons.directions_car_filled_rounded),
                  color: CarsAppTheme.mainBlue,
                  size: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
