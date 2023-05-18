mixin LoginValidator {

  String? isNotEmpty(String? value, [String? message]){
    if(value!.isEmpty) return message ?? 'Este campo é obrigatório';
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

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Campo vazio.';
    }
    if (value.length < 8) {
      return 'Campo deve conter, no mínimo, 8 caracteres.';
    }
    return 'null';
  }

  // String validateLogin(String value) {
  //   if (value.isEmpty ||
  //       value.contains(" ") ||
  //       value.length < 5 ||
  //       !value.contains("@")) {
  //     return 'Email não valido.';
  //   }
  //   return 'null';
  // }



  // String validatePassword(String value) {
  //   if (value.isEmpty) {
  //     return 'Campo vazio.';
  //   }
  //   if (value.length < 8) {
  //     return 'Campo deve conter, no mínimo, 8 caracteres.';
  //   }
  //   return 'null';
  // }
}