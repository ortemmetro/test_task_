import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_task/login_page/login_page.dart';
import 'package:test_task/main_page/main_page.dart';
import 'package:test_task/registrastion_page/registration_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => LoginPage(),
        "/registration": (context) => RegistrationPage(),
        "/main_page": (context) => const MainPage(),
      },
      initialRoute: "/",
    );
  }
}
