import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static void onSuccess(
      {required GlobalKey<ScaffoldMessengerState> scaffoldKey,
      required String message,
      required int seconds,
      required Function onPop}) {
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        // backgroundColor: const Color(0xff58355E),
        backgroundColor: CarsAppTheme.mainBlue,
        duration: Duration(seconds: seconds ?? 2),
      ),
    );

    Future.delayed(Duration(seconds: seconds ?? 2))
        .then(onPop as FutureOr Function(dynamic value));
  }

  // static void onFail({required GlobalKey<ScaffoldState> scaffoldKey,
  static void onFail(
      {required GlobalKey<ScaffoldMessengerState> scaffoldKey,
      required String message,
      required int seconds,
      Function? onPop}) {
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        // backgroundColor: const Color(0xff58355E),
        backgroundColor: CarsAppTheme.mainBlue,
        duration: Duration(seconds: seconds ?? 3),
      ),
    );

    Future.delayed(Duration(seconds: seconds ?? 3))
        .then(onPop as FutureOr Function(dynamic value));
  }
}