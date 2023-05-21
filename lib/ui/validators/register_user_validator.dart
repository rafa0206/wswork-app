import 'package:wswork_app/repository/local/user_repository.dart';

mixin RegisterUserValidator {
  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Campo vazio.';
    }
    if (value.length < 3) {
      return 'Nome deve ter pelo menos mais de 2 caracteres.';
    }
    if (!RegExp(r'[a-zA-Z;]+$').hasMatch(value)) {
      return 'Insira apenas letras';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty ||
        value.contains(" ") ||
        value.length < 5 ||
        !value.contains("@")) {
      return 'Email não valido.';
    }
    return null;
  }

  Future<String?> verifyEmail(String email) async {
    String? checkEmailDB = await UserRepository.instance.emailExists(email);
    if (checkEmailDB == email) {
      return 'Email já cadastrado';
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
    if (value.length < 15) {
      return 'Insira um número valido.';
    }
    return null;
  }
}
