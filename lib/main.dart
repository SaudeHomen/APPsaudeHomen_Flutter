import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

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
      theme: ThemeData(
        primaryColor: const Color(0xFF2B9BFF),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2B9BFF)),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
      },
    );
  }
}
