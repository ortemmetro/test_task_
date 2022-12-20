import 'dart:developer';

class LoginPageModel {
  bool authentication({
    required String login,
    required String password,
  }) {
    if (login == "admin" && password == "admin") {
      return true;
    }
    return false;
  }
}
