import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wswork_app/entities/user.dart';
import 'package:wswork_app/repository/local/user_repository.dart';

class UserModel extends ChangeNotifier {
  User? user;

  static UserModel of(BuildContext context) {
    return Provider.of<UserModel>(context, listen: false);
  }

  void login(String email, String password,
      {required Function() onSucess,
      required Function(String message) onFail}) async {
    await UserRepository.instance
        .getUserByEmailPassword(email, password)
        .then((e) async {
      if (e != null) {
        user = await UserRepository.instance
            .getUserByEmailPassword(email, password);
        notifyListeners();
        onSucess();
      } else {
        onFail('email: "$email" não cadastrado');
      }
    });
    notifyListeners();
  }

  void registerUser(
      String username, String email, String password, String phone,
      {required Function() onSucess,
      required Function(String message) onFail}) async {
    String? checkEmailDB = await UserRepository.instance.emailExists(email);
    if (checkEmailDB == email) {
      onFail('Email já cadastrado');
    } else {
      user =
          User(name: username, email: email, password: password, phone: phone);
      notifyListeners();
      await UserRepository.instance.registerUserOnDB(user!);
      onSucess();
      notifyListeners();
    }
  }
}
