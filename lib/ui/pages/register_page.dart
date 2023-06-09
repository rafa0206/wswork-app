import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wswork_app/models/user_model.dart';
import 'package:wswork_app/ui/pages/login_page.dart';
import 'package:wswork_app/ui/validators/register_user_validator.dart';
import 'package:wswork_app/ui/widgets/carsapp_theme_data.dart';
import 'package:wswork_app/ui/widgets/custom_button.dart';
import 'package:wswork_app/ui/widgets/login_form.dart';
import 'package:wswork_app/ui/widgets/message.dart';
import 'package:wswork_app/ui/widgets/password_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with RegisterUserValidator {
  var obscureText = true;

  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPassword = FocusNode();
  final FocusNode _focusPhone = FocusNode();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  final maskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

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
                  'Cadastro',
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
                  validator: validateName,
                  requestFocus: _focusEmail,
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  labelText: 'Nome',
                  hintText: 'Nome',
                  iconForm: const Icon(
                    (Icons.person),
                    color: CarsAppTheme.mainBlue,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultForm(
                  validator: validateEmail,
                  focusNode: _focusEmail,
                  requestFocus: _focusPassword,
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  labelText: 'Email',
                  hintText: 'example@email.com',
                  iconForm: const Icon(
                    (Icons.mail),
                    color: CarsAppTheme.mainBlue,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PasswordForm(
                  validator: validatePassword,
                  focusNode: _focusPassword,
                  requestFocus: _focusPhone,
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
                            color: CarsAppTheme.mainBlue,
                          )
                        : const Icon(
                            (Icons.visibility),
                            color: CarsAppTheme.mainBlue,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultForm(
                  validator: validatePhone,
                  inputFormatters: [maskFormatter],
                  focusNode: _focusPhone,
                  controller: _phoneController,
                  keyboardType: TextInputType.text,
                  labelText: 'Telefone',
                  hintText: '(00)00000-0000',
                  iconForm: const Icon(
                    (Icons.phone),
                    color: CarsAppTheme.mainBlue,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  textButton: 'CADASTRAR',
                  onTap: () {
                    _registerOnPressed(context);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  textButton: 'LOGIN',
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const LoginPage()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _registerOnPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState != null) {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      print('email ${_emailController.text}');
      print('senha ${_passwordController.text}');
      UserModel.of(context).registerUser(
          _nameController.text,
          _emailController.text,
          _passwordController.text,
          _phoneController.text, onSucess: () {
        Message.onSuccess(
            scaffoldKey: _scaffoldKey,
            message: 'Usuário cadastrado com sucesso',
            seconds: 2,
            onPop: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const LoginPage()));
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
