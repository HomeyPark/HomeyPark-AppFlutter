import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
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
                    child: TextField(
                      controller: emailFieldController,
                      decoration: const InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: TextField(
                      controller: passwordFieldController,
                      obscureText: !passwordVisible,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscuringCharacter: "*",
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
                    child: TextField(
                      controller: repeatPasswordFieldController,
                      obscureText: !repeatPasswordVisible,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        labelText: 'Repetir contraseña',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                repeatPasswordVisible = !repeatPasswordVisible;
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
                                fontSize: theme.textTheme.labelMedium!.fontSize,
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
                        print({
                          "email": emailFieldController.text,
                          "password": passwordFieldController.text,
                          "repeatPassword": repeatPasswordFieldController.text
                        });
                        emailFieldController.clear();
                        passwordFieldController.clear();
                        repeatPasswordFieldController.clear();
                      },
                      child: const Text('Registrarse'),
                    ),
                  ),
                ],
              ),
            )));
  }
}
