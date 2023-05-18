import 'package:flutter/material.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';

import 'message.dart';

// ignore: must_be_immutable
class ExitButton extends StatelessWidget {
  ExitButton({super.key, this.scaffoldKey, this.isProfilePage});


  GlobalKey<ScaffoldState>? scaffoldKey;
  bool? isProfilePage;

  // ExitButton({this.scaffoldKey, this.isProfilePage});


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
          // backgroundColor: MaterialStateProperty.all(Color(0xff58355E)),
          backgroundColor: MaterialStateProperty.all(CarsAppTheme.mainBlue),
        ),
        onPressed: () {
          if(isProfilePage == null){
            // _logoutOnPressed(context);
          }else{
            scaffoldKey?.currentState!.openEndDrawer();
            // _logoutOnPressed(context);
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

  /*void _logoutOnPressed(BuildContext context) {
    UserModel.of(context).logout(
        onSuccess: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context){
            return LoginPage();
          }));
          return;
        }, onFail: (String message) {
      Message.onFail(
        scaffoldKey: scaffoldKey,
        message: message,
      );
      return;
    });
  }*/
}
