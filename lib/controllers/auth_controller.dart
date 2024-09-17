import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Método de login
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Erro ao fazer login: $e');
      return null;
    }
  }

  // Método de cadastro
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Erro ao criar conta: $e');
      return null;
    }
  }

  // Método de logout
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Erro ao fazer logout: $e');
    }
  }

  // Método para recuperação de senha
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Erro ao enviar e-mail de recuperação: $e');
    }
  }
}
