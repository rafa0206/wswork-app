import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wswork_app/entities/user.dart';
import 'package:wswork_app/repository/local/user_repository.dart';

class UserModel extends ChangeNotifier {
   // late User user;
   User? user;

  static UserModel of(BuildContext context) {
    return Provider.of<UserModel>(context, listen: false);
  }

  void login(String email, String password,
      {Function? onSucess, Function(String message)? onFail}) async {
    user?.id = await UserRepository.instance.getUserIdByEmailPassword(email, password);
    await UserRepository.instance.getUserByEmailPassword(email, password).then((e){
      if(e != null){
        onSucess!();
      }else {
        onFail!('Erro ao efetuar login para $email');
      }
    });
    notifyListeners();
  }

  void registerUser(String username, String email, String password,
      String phone,
      {Function? onSucess, Function(String message)? onFail}) async {
    // User user = User(/*id: id,*/
    user = User(/*id: id,*/
        name: username,
        email: email,
        password: password,
        phone: phone);
    // if(user != null){
      await UserRepository.instance.registerUserOnDB(user!);
      onSucess!();
    notifyListeners();
    // } else {
    //   onFail!('Erro ao efetuar cadastro para $username');
    // }
  }
}





/*void login(String username, String password) async {
    // user = await UserApi.instance.signIn(username, password);

    if (user != null) {
      await UserRepository.instance.saveUser(user);
      onSucess();
    } else {
      onFail('Erro ao efetuar login para $username');
    }
  }*/

// void loginApp() async{
//   await
// }

// void login(String username, String password, Function onSucess,
//     Function(String message) onFail) async {
//   user = await UserApi.instance.signIn(username, password);
//
//   if (user != null) {
//     await UserRepository.instance.saveUser(user);
//     onSucess();
//   } else {
//     onFail('Erro ao efetuar login para $username');
//   }
// }