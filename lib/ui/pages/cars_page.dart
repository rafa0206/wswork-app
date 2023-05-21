import 'package:flutter/material.dart';
import 'package:wswork_app/entities/car.dart';
import 'package:wswork_app/models/car_model.dart';
import 'package:wswork_app/models/user_model.dart';
import 'package:wswork_app/ui/widgets/list_car_cards.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';
import 'package:wswork_app/ui/widgets/custom_button.dart';
import 'package:wswork_app/ui/widgets/custom_navigation_drawer.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({Key? key}) : super(key: key);

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {

  final _homeKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeKey,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        // iconTheme: const IconThemeData(color: CarsAppTheme.mainBlue),
        centerTitle: true,
        title: const Text(
          'CARS APP',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF-Mono',
              // fontSize: 15,
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ),
        // backgroundColor: Color(0xffF7F2F8),
      ),
      drawer: CustomNavigationDrawer(scaffoldKey: _homeKey),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Column(
          children: [
             const SizedBox(
              // height: 500,
              height: 400,
              child: ListCarCards(
                // registerLead: registerLeadOnPressed,
              ),
            ),
            const Divider(
              thickness: 1,
              color: CarsAppTheme.mainBlue,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(textButton: 'EU QUERO', onTap: (){
              CarModel.of(context).doLead(
                  UserModel.of(context).user!.email,
                  UserModel.of(context).user!.password
              );
            }),
          ],
        ),
      ),
    );
  }

  // void registerLeadOnPressed(){
  //   Car car = Future.value(futureCars).then((value) => value?.where((element) => element.isSelected == true)).toList();
  // }
}
