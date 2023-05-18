import 'package:flutter/material.dart';
import 'package:wswork_app/ui/pages/cars_page.dart';
import 'package:wswork_app/ui/pages/leads_page.dart';
import 'package:wswork_app/ui/pages/profile_page.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';

import 'exit_button.dart';

class CustomNavigationDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const CustomNavigationDrawer({super.key, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            /*ScopedModelDescendant<UserModel>(builder:
                (BuildContext context, Widget child, UserModel userModel) {
              return*/ Container(
                decoration: const BoxDecoration(
                  color: CarsAppTheme.mainBlue,
                  /*image: DecorationImage(
                    image: AssetImage('assets/images/back_account.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.transparent.withOpacity(0.4),
                        BlendMode.colorBurn),
                  ),*/
                ),
                height: 203,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40, left: 30),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xff909FAD),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 30, bottom: 4),
                      child: Text(/*userModel.user.name ??*/ 'Usuário',
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontFamily: 'SF-Mono',
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        /*userModel.user.email ??*/ 'usuario@email.com',
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontFamily: 'SF-Mono',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            // }),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: ListTile(
                onTap: () {
                  scaffoldKey?.currentState?.openEndDrawer();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ProfilePage();
                  }));
                },
                title: const Text(
                  'Meu Perfil',
                  style: TextStyle(
                    // color: Color(0xff58355E),
                    color: CarsAppTheme.mainBlue,
                    fontFamily: 'SF-Mono',
                    fontSize: 16,
                  ),
                ),
                leading: const Icon(
                  Icons.account_circle,
                  // color: Color(0xff949191),
                  color: CarsAppTheme.mainDarkGrey,
                  size: 25,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  // color: Color(0xff949191),
                  color: CarsAppTheme.mainDarkGrey,
                  size: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: ListTile(
                onTap: () {
                  scaffoldKey?.currentState?.openEndDrawer();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const CarsPage();
                  }));
                },
                title: const Text(
                  'Home',
                  style: TextStyle(
                    // color: Color(0xff58355E),
                    color: CarsAppTheme.mainBlue,
                    fontFamily: 'SF-Mono',
                    fontSize: 16,
                  ),
                ),
                leading: const Icon(
                  Icons.home_filled,
                  // color: Color(0xff949191),
                  color: CarsAppTheme.mainDarkGrey,
                  size: 25,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  // color: Color(0xff949191),
                  color: CarsAppTheme.mainDarkGrey,
                  size: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: ListTile(
                onTap: () {
                  scaffoldKey?.currentState?.openEndDrawer();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const LeadsPage();
                  }));
                },
                title: const Text(
                  'Compras',
                  style: TextStyle(
                    // color: Color(0xff58355E),
                    color: CarsAppTheme.mainBlue,
                    fontFamily: 'SF-Mono',
                    fontSize: 16,
                  ),
                ),
                leading: const Icon(
                  Icons.playlist_add_check,
                  color: CarsAppTheme.mainDarkGrey,
                  size: 25,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  // color: Color(0xff949191),
                  color: CarsAppTheme.mainDarkGrey,
                  size: 16,
                ),
              ),
            ),
            const SizedBox(height: 120),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: ExitButton(scaffoldKey: scaffoldKey),
            ),
          ],
        ),
      ),
    );
  }
}
