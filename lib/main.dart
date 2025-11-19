import 'package:flutter/material.dart';

// TELAS
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/register_screen.dart';
import 'screens/profile_screen.dart';

// GERENCIADORES DE TEMA
import 'services/theme_manager.dart';
import 'services/app_theme.dart';

void main() {
  runApp(const AppSaudeHomem());
}

class AppSaudeHomem extends StatelessWidget {
  const AppSaudeHomem({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier, // ← alterna entre claro/escuro
      builder: (_, themeMode, __) {
        return MaterialApp(
          title: 'Saúde do Homem',
          debugShowCheckedModeBanner: false,

          // Tema dinâmico
          themeMode: themeMode,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),

          // Rotas
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginScreen(),
            '/home': (context) => const HomeScreen(),
            '/register': (context) => const RegisterScreen(),
            '/profile': (context) => const ProfileScreen(),
          },
        );
      },
    );
  }
}
