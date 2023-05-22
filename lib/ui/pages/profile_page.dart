import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wswork_app/models/user_model.dart';
import 'package:wswork_app/ui/widgets/exit_button.dart';
import 'package:wswork_app/ui/widgets/profile_content.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const ProfilePage({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'MEU PERFIL',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF-Mono',
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<UserModel>(builder:
                    (BuildContext context, UserModel userModel, Widget? widget) {
                  return ProfileContent(
                    userName: userModel.user!.name.toUpperCase(),
                    userEmail: userModel.user!.email,
                    userPhone: userModel.user!.phone,
                  );
                }),
                const SizedBox(height: 58),
                ExitButton(scaffoldKey: scaffoldKey, isProfilePage: true),
              ],
            ),
          )),
    );
  }
}
