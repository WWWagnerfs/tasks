import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;

                var user = await authController.login(email, password);
                if (user != null) {
                  Navigator.pushNamed(context, '/home', arguments: user.uid);
                } else {
                  print('Falha no login');
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Não tem conta? Cadastre-se'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/reset_password');
              },
              child: Text('Esqueceu a senha?'),
            ),
          ],
        ),
      ),
    );
  }
}
