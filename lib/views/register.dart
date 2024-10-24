import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final _registerFormKey = GlobalKey<FormState>();

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool passwordVisible = false;
  bool repeatPasswordVisible = false;

  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();
  final repeatPasswordFieldController = TextEditingController();

  String? validateEmptyFields(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es requerido';
    }
    return null;
  }

  String? validateEmail(String? email) {
    var isEmpty = validateEmptyFields(email);

    if (isEmpty != null) return isEmpty;

    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final isEmailValid = emailRegExp.hasMatch(email ?? '');

    if (!isEmailValid) return 'Por favor, introduce un email válido';

    return null;
  }

  String? validatePassword(String? password) {
    var isEmpty = validateEmptyFields(password);

    if (isEmpty != null) return isEmpty;

    if (password!.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }

    return null;
  }

  String? validateRepeatPassword(String? repeatPassword) {
    var isEmpty = validateEmptyFields(repeatPassword);

    if (isEmpty != null) return isEmpty;

    if (repeatPassword != passwordFieldController.text) {
      return 'Las contraseñas no coinciden';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Form(
                key: _registerFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Crear cuenta",
                      style: TextStyle(
                        fontSize: theme.textTheme.headlineMedium!.fontSize,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: TextFormField(
                        controller: emailFieldController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        validator: validateEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: TextFormField(
                        controller: passwordFieldController,
                        obscureText: !passwordVisible,
                        enableSuggestions: false,
                        autocorrect: false,
                        obscuringCharacter: "*",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validatePassword,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              icon: Icon(passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: TextFormField(
                        controller: repeatPasswordFieldController,
                        obscureText: !repeatPasswordVisible,
                        enableSuggestions: false,
                        autocorrect: false,
                        obscuringCharacter: "*",
                        validator: validateRepeatPassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Repetir contraseña',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  repeatPasswordVisible =
                                      !repeatPasswordVisible;
                                });
                              },
                              icon: Icon(repeatPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "¿Tienes una cuenta?",
                            style: TextStyle(
                                color: theme.colorScheme.onSurface,
                                fontSize: theme.textTheme.labelMedium!.fontSize,
                                fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(left: 4),
                            ),
                            child: Text(
                              "Inicia sesión",
                              style: TextStyle(
                                  color: theme.colorScheme.primary,
                                  fontSize:
                                      theme.textTheme.labelMedium!.fontSize,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          if (_registerFormKey.currentState!.validate()) {
                            Future.delayed(const Duration(seconds: 3), () {
                              emailFieldController.clear();
                              passwordFieldController.clear();
                              repeatPasswordFieldController.clear();
                            });

                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Procesando datos'),
                              duration: Duration(seconds: 3),
                            ));
                          }
                        },
                        child: const Text('Registrarse'),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  String? validateEmptyField(String value) {
    if (value.isEmpty) {
      return 'Este campo es requerido';
    }
    return null;
  }
}
