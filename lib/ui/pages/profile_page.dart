import 'package:flutter/material.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';
import 'package:wswork_app/ui/widgets/exit_button.dart';
import 'package:wswork_app/ui/widgets/profile_content.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const ProfilePage({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: CarsAppTheme.mainBlue,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'MEU PERFIL',
          style: TextStyle(
              // color: Color(0xff58355E),
              color: Colors.white,
              fontFamily: 'SF-Mono',
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ),
        // backgroundColor: Color(0xffF7F2F8),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              ProfileContent(
                userName: 'NOME DO USUARIO',
                userEmail: 'usuario@email.com',
                userPhone: '(11)91111-1111',
              ),
              /*ScopedModelDescendant<UserModel>(builder:
                  (BuildContext context, Widget child, UserModel userModel) {
                return ProfileContent(
                  userName:
                  userModel.user.name.toUpperCase() ?? 'NOME DO USUARIO',
                  userEmail: userModel.user.email ?? 'usuario@email.com',
                  userPhone: userModel.user.phone ?? '(11)91111-1111',
                );
              }),*/
              const SizedBox(height: 58),
              ExitButton(scaffoldKey: scaffoldKey, isProfilePage: true),
            ],
          )),
    );
  }
}
