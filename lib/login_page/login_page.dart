import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/login_page/login_page_model.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _LoginPageBody(
            loginController: loginController,
            passwordController: passwordController,
          ),
        ),
      ),
    );
  }
}

class _LoginPageBody extends StatelessWidget {
  const _LoginPageBody({
    Key? key,
    required this.loginController,
    required this.passwordController,
  }) : super(key: key);
  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 120),
        const LogoAndText(),
        const SizedBox(height: 70),
        _LoginPasswordTextFields(
          loginController: loginController,
          passwordController: passwordController,
        ),
        const SizedBox(height: 16.0),
        _SignInButton(
          loginController: loginController,
          passwordController: passwordController,
        ),
        const SizedBox(height: 39),
        const Text(
          "Или войдите через другие сервисы",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 26),
        const _FacebookGoogleRow(),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Забыли пароль?",
            style: TextStyle(
                color: Color(0xff44C9C5),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 38),
        TextButton(
          onPressed: () => Navigator.of(context).pushNamed("/registration"),
          child: const Text(
            "Регистрация",
            style: TextStyle(
              color: Color(0xff44C9C5),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}

class _FacebookGoogleRow extends StatelessWidget {
  const _FacebookGoogleRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xffF5F7F6)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 20, vertical: 14)),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset('assets/svgs/Vector.svg'),
                  Positioned(
                    left: 9,
                    top: 6.5,
                    child: SvgPicture.asset('assets/svgs/Vector-1.svg'),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Text(
                "Facebook",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xffF5F7F6)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 30, vertical: 16)),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset("assets/svgs/google-4.svg"),
                  Positioned(
                    left: 2,
                    child: SvgPicture.asset("assets/svgs/google-1.svg"),
                  ),
                  Positioned(
                    top: 16,
                    left: 2,
                    child: SvgPicture.asset("assets/svgs/google-2.svg"),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 0,
                    child: SvgPicture.asset("assets/svgs/google-3.svg"),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              const Text(
                "Google",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    Key? key,
    required this.loginController,
    required this.passwordController,
  }) : super(key: key);
  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        bool ifAuth = LoginPageModel().authentication(
            login: loginController.text, password: passwordController.text);
        if (ifAuth) {
          Navigator.of(context).pushNamed("/main_page");
        }
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(450.0, 52.0)),
        padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
      ),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(35, 156, 198, 1),
              Color.fromRGBO(74, 209, 197, 1),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 400,
            maxHeight: 52,
          ),
          alignment: Alignment.center,
          child: const Text('Войти'),
        ),
      ),
    );
  }
}

class _LoginPasswordTextFields extends StatelessWidget {
  const _LoginPasswordTextFields({
    Key? key,
    required this.loginController,
    required this.passwordController,
  }) : super(key: key);
  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: loginController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color(0xffF5F7F6),
            filled: true,
            hintText: "Логин",
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
      ],
    );
  }
}

class LogoAndText extends StatelessWidget {
  const LogoAndText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          Positioned(
            top: 14.91,
            left: 43.7,
            child: SvgPicture.asset('assets/svgs/Rectangle_1.svg'),
          ),
          Positioned(
            left: 1.22,
            top: 25.01,
            child: SvgPicture.asset('assets/svgs/Rectangle_3.svg'),
          ),
          Positioned(
            top: 1.22,
            left: 22.46,
            child: SvgPicture.asset('assets/svgs/Rectangle_2.svg'),
          ),
          Positioned(
            top: 5.47,
            left: 64.94,
            child: SvgPicture.asset('assets/svgs/Rectangle_4.svg'),
          ),
          Positioned(
            top: 25.05,
            right: 0.61,
            child: SvgPicture.asset('assets/svgs/Rectangle_5.svg'),
          ),
          Positioned(
            left: 13,
            bottom: 5,
            child: Row(
              children: const [
                Text(
                  "in",
                  style: TextStyle(
                    fontSize: 22.65,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff4BE2DE),
                  ),
                ),
                Text(
                  "Voice",
                  style: TextStyle(
                    fontSize: 22.65,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
