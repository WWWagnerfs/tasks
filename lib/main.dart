import 'package:flutter/material.dart';
import 'app_routes.dart';  // Importe o arquivo de rotas

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase App',
      initialRoute: AppRoutes.login,  // Rota inicial
      onGenerateRoute: AppRoutes.generateRoute,  // Define o onGenerateRoute
    );
  }
}
