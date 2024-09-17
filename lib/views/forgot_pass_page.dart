import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recuperar Senha')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Chamar o controller para recuperação de senha
                Navigator.pop(context);  // Volta para a tela de login após enviar o e-mail de recuperação
              },
              child: Text('Recuperar Senha'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);  // Volta para a tela de login
              },
              child: Text('Voltar ao Login'),
            ),
          ],
        ),
      ),
    );
  }
}
