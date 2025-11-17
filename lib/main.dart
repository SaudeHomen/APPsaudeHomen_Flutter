import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(const AppSaudeHomem());
}

class AppSaudeHomem extends StatelessWidget {
  const AppSaudeHomem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saúde do Homem',
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}

