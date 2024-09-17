import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
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
              onPressed: () {
                // Chamar o controller para criar nova conta
                Navigator.pop(context);  // Volta para o login após o cadastro
              },
              child: Text('Cadastrar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);  // Volta para a tela de login
              },
              child: Text('Já tem conta? Faça login'),
            ),
          ],
        ),
      ),
    );
  }
}
