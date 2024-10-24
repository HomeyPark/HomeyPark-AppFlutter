import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Contraseña',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Repetir contraseña',
                        border: OutlineInputBorder(),
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
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Text('Registrarse'),
                    ),
                  ),
                ],
              ),
            )));
  }
}
