import 'package:flutter/material.dart';
import 'package:wswork_app/ui/pages/cars_page.dart';
import 'package:wswork_app/ui/pages/leads_page.dart';
import 'package:wswork_app/ui/pages/profile_page.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  final tabs = [
    const CarsPage(),
    const LeadsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        unselectedItemColor: CarsAppTheme.mainDarkGrey,
        selectedItemColor: CarsAppTheme.mainBlue,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              (Icons.home_filled),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Compras',
            icon: Icon(
              (Icons.playlist_add_check),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Perfil',
            icon: Icon(
              (Icons.account_circle),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
