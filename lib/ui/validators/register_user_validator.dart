import 'package:wswork_app/entities/user.dart';
import 'package:wswork_app/repository/local/user_repository.dart';

mixin RegisterUserValidator {

  // RegExp('[a-zA-Z]')

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Campo vazio.';
    }
    if (value.length < 3){
      return 'Nome deve ter pelo menos mais de 2 caracteres.';
    }
    if(RegExp('[a-zA-Z]').hasMatch(value)){
      return 'Insira apenas letras';
    }
    return null;
  }

  String? validateEmail(String? value) {
    String? userEmailMessage =
        verifyEmail(value!).then((element) => element).toString();
    if (userEmailMessage != value) {
      return userEmailMessage;
    }
    if (value.isEmpty ||
        value.contains(" ") ||
        value.length < 5 ||
        !value.contains("@")) {
      return 'Email não valido.';
    }
    return null;
  }

  Future<String?> verifyEmail(String email) async {
    String? userEmail = await UserRepository.instance.emailExists(email);
    if (userEmail == email) {
      return 'Email já cadastrado';
    }
    if (userEmail == null) {
      return userEmail;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Campo vazio.';
    }
    if (value.length < 8) {
      return 'Campo deve conter, no mínimo, 8 caracteres.';
    }
    return null;
  }
  
  String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return 'Campo vazio.';
    }
    if (value.length < 15){
      return 'Insira um número valido.';
    }
    return null;
  }


}
