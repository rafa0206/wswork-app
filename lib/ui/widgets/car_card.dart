import 'package:flutter/material.dart';
import 'package:wswork_app/entities/car.dart';
import 'package:wswork_app/models/car_model.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';

//ignore: must_be_immutable
class CarCard extends StatefulWidget {
  Car car;
  // bool? isSelected;
  // Widget iconCar;

  CarCard({
    Key? key,
    required this.car,
    // this.isSelected,
    // required this.iconCar,
  }) : super(key: key);

  @override
  State<CarCard> createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {

  // late bool value;


  @override
  void initState() {
    super.initState();
    // value = false;
    // widget.isSelected = false;
    // widget.isSelected = value;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: CarsAppTheme.mainGrey,
        child: Padding(
          padding: const EdgeInsets.all(15),
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
                        // 'NOME do carro',
                        '${widget.car.brandName} ${widget.car.modelName} ${widget.car.year}',
                        // '${widget.car.brandName}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'SF-Mono',
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Combustível: ${widget.car.fuel}\n'
                        'Número de portas: ${widget.car.numDoors}\n'
                        'Valor Fipe: ${widget.car.fipeValue}\n'
                        'Cor: ${widget.car.color}',
                        style: const TextStyle(
                          color: CarsAppTheme.mainDarkGrey,
                          fontFamily: 'SF-Mono',
                          fontSize: 15,
                          // fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                  widget.car.isSelected == true
                      ? const Icon(
                          (Icons.directions_car_filled_rounded),
                          color: CarsAppTheme.mainBlue,
                          size: 50,
                        )
                      : const Icon(
                          (Icons.directions_car_filled_rounded),
                          color: CarsAppTheme.mainDarkGrey,
                          size: 50,
                        ),
                  /*Icon(
                    (Icons.directions_car_filled_rounded),
                    color: CarsAppTheme.mainBlue,
                    size: 50,
                  ),
                  Icon(
                    (Icons.directions_car_filled_outlined),
                    color: CarsAppTheme.mainBlue,
                    size: 50,
                  ),*/
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        CarModel.of(context).selectCarCard(widget.car);
      },
    );
  }
}
