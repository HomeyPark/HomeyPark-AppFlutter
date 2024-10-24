import 'package:flutter/material.dart';
import 'package:homey_park_mobile_app/views/register.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'util.dart';
import 'theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Rubik", "Rubik");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const Register(),
    );
  }
}
