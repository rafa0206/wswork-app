import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wswork_app/models/car_model.dart';
import 'package:wswork_app/models/user_model.dart';
import 'package:wswork_app/ui/pages/home_page.dart';
import 'package:wswork_app/ui/pages/login_page.dart';
import 'package:wswork_app/ui/pages/register_page.dart';
import 'package:wswork_app/ui/pages/splash_page.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';

/*void main() {
  runApp(const WsWorkApp());
}*/

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserModel()),
      ChangeNotifierProvider(create: (context) => CarModel())
    ],
      child: const WsWorkApp()));
}

class WsWorkApp extends StatelessWidget {
  const WsWorkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SF-Mono',
        primaryColor: Colors.amber,
        appBarTheme: const AppBarTheme(color: CarsAppTheme.mainBlue),
        scaffoldBackgroundColor: Colors.white,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const SplashScreen(),
      // home: const LoginPage(),
      // home: const RegisterPage(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
