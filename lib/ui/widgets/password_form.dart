import 'package:flutter/material.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';

//ignore: must_be_immutable
class PasswordForm extends StatelessWidget {
  TextEditingController controller;
  String labelText;
  String hintText;
  TextInputType keyboardType;
  bool? obscureText;
  FocusNode? focusNode;
  FocusNode? requestFocus;
  Widget? suffixIcon;
  FormFieldValidator<String>? validator;

  PasswordForm(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.obscureText,
      this.suffixIcon,
      this.focusNode,
      this.requestFocus,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: CarsAppTheme.mainBlue,
        ),
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText ?? true,
        keyboardType: keyboardType,
        focusNode: focusNode,
        onFieldSubmitted: (value) {
          if (requestFocus != null) {
            FocusScope.of(context).requestFocus(requestFocus);
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          prefixIcon: const Icon(
            (Icons.lock),
            color: CarsAppTheme.mainBlue,
          ),
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: CarsAppTheme.mainBlue,
            fontFamily: 'SF-Mono',
            fontSize: 16,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: CarsAppTheme.mainDarkGrey,
            fontFamily: 'SF-Mono',
            fontSize: 16,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
