import 'package:flutter/material.dart';
import 'package:tasks/views/forgot_pass_page.dart';
import 'package:tasks/views/home_page.dart';
import 'package:tasks/views/login_page.dart';
import 'package:tasks/views/sign_up_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String resetPassword = '/reset_password';
  static const String home = '/home';

  // Método para gerar as rotas
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case signUp:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case resetPassword:
        return MaterialPageRoute(builder: (_) => ResetPasswordPage());
      case home:
        String userId = settings.arguments as String;  // Captura o argumento userId
        return MaterialPageRoute(builder: (_) => HomePage(userId: userId));
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
