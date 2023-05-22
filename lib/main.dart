import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wswork_app/models/car_model.dart';
import 'package:wswork_app/models/lead_model.dart';
import 'package:wswork_app/models/user_model.dart';
import 'package:wswork_app/ui/pages/login_page.dart';
import 'package:wswork_app/ui/pages/splash_page.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserModel()),
    ChangeNotifierProvider(create: (context) => CarModel()),
    ChangeNotifierProvider(create: (context) => LeadModel())
  ], child: const WsWorkApp()));
}

class WsWorkApp extends StatelessWidget {
  const WsWorkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SF-Mono',
        // primaryColor: Colors.amber,
        appBarTheme: const AppBarTheme(color: CarsAppTheme.mainBlue),
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: const LoginPage(),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
