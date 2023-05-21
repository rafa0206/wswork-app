import 'package:flutter/material.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';

// ignore: must_be_immutable
class ExitButton extends StatelessWidget {
  ExitButton({super.key, this.scaffoldKey, this.isProfilePage});

  GlobalKey<ScaffoldState>? scaffoldKey;
  bool? isProfilePage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
          backgroundColor: MaterialStateProperty.all(CarsAppTheme.mainBlue),
        ),
        onPressed: () {
          if (isProfilePage == null) {
          } else {
            scaffoldKey?.currentState!.openEndDrawer();
          }
        },
        child: const Text(
          'Sair',
          style: TextStyle(
              fontFamily: 'SF-Mono',
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
