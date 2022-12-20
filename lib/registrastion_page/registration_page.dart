import 'package:flutter/material.dart';

import '../login_page/login_page.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 120),
              const LogoAndText(),
              const SizedBox(height: 74),
              TextField(
                controller: loginController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: const Color(0xffF5F7F6),
                  filled: true,
                  hintText: "Email",
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: const Color(0xffF5F7F6),
                  filled: true,
                  hintText: "Пароль",
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: const Color(0xffF5F7F6),
                  filled: true,
                  hintText: "Подтверждение пароля",
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: Checkbox(
                      value: false,
                      onChanged: (value) => true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                      side: const BorderSide(
                        color: Color(0xff44C9C5),
                        width: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const SizedBox(
                    width: 311,
                    height: 36,
                    child: Text(
                      "Я принимаю условия Пользовательского соглашения и Политики конфиденциальности",
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
