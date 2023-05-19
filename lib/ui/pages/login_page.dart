import 'package:flutter/material.dart';
import 'package:wswork_app/models/user_model.dart';
import 'package:wswork_app/ui/pages/home_page.dart';
import 'package:wswork_app/ui/validators/login_validator.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';
import 'package:wswork_app/ui/widgets/custom_button.dart';
import 'package:wswork_app/ui/widgets/login_form.dart';
import 'package:wswork_app/ui/widgets/message.dart';
import 'package:wswork_app/ui/widgets/password_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginValidator {
  var obscureText = true;

  final FocusNode _focusPassword = FocusNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 180,
                ),
                const Text(
                  'CARS APP',
                  style: TextStyle(
                    fontFamily: 'SF-Mono',
                    fontSize: 24,
                    color: CarsAppTheme.mainBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'SF-Mono',
                    fontSize: 20,
                    color: CarsAppTheme.mainBlue,
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                DefaultForm(
                    requestFocus: _focusPassword,
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    labelText: 'Email',
                    hintText: 'example@email.com',
                    iconForm: const Icon(
                      // (Icons.person),
                      (Icons.mail),
                      color: CarsAppTheme.mainBlue,
                    ),
                    validator: validateEmail),
                const SizedBox(
                  height: 20,
                ),
                PasswordForm(
                    focusNode: _focusPassword,
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    labelText: 'Senha',
                    hintText: 'Letras, números e caracteres',
                    obscureText: obscureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: obscureText
                          ? const Icon(
                              (Icons.visibility_off_sharp),
                              // color: Color(0xff58355E),
                              color: CarsAppTheme.mainBlue,
                            )
                          : const Icon(
                              (Icons.visibility),
                              // color: Color(0xff58355E),
                              color: CarsAppTheme.mainBlue,
                            ),
                    ),
                    validator: validatePassword),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  textButton: 'LOGIN',
                  onTap: () {
                    // _loginOnPressed(context);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  textButton: 'CADASTRAR',
                  onTap: () {
                    // _loginOnPressed(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _loginOnPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState != null) {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      UserModel.of(context)
          .login(_emailController.text, _passwordController.text, onSucess: () {
        Message.onSuccess(
            scaffoldKey: _scaffoldKey,
            message: 'Usuário logado com sucesso',
            seconds: 2,
            onPop: (value) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage()));
            });
        return;
      }, onFail: (String message) {
        Message.onFail(
          scaffoldKey: _scaffoldKey,
          message: message,
          seconds: 2,
        );
        return;
      });
    }
  }
}
