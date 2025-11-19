import 'package:flutter/material.dart';

class AppTheme {
  // ========================================================================
  // 🎨 TEMA CLARO
  // ========================================================================
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF395B8C),
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFF7F2FD),
      cardColor: Colors.white,
      primaryColor: const Color(0xFF395B8C),

      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black87),
        bodyLarge: TextStyle(color: Colors.black87),
        titleLarge: TextStyle(color: Color(0xFF395B8C)),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF3EEFB),

        // 👇 CORRIGINDO TEXTO E HINT PARA FICAREM LEGÍVEIS NO TEMA CLARO
        labelStyle: const TextStyle(color: Color(0xFF395B8C)),
        hintStyle: const TextStyle(color: Colors.black54),
        suffixIconColor: Colors.black45,

        // Texto dentro do campo
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7F5AE0),
          foregroundColor: Colors.white,
        ),
      ),

      useMaterial3: true,
    );
  }

  // ========================================================================
  // 🌙 TEMA ESCURO
  // ========================================================================
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF8E6FD6),
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xFF0D0D11),
      cardColor: const Color(0xFF1A1A22),
      primaryColor: const Color(0xFF8E6FD6),

      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white70),
        bodyLarge: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Color(0xFF9C8CFF)),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF262630),
        labelStyle: const TextStyle(color: Colors.white70),
        hintStyle: const TextStyle(color: Colors.white54),
        suffixIconColor: Colors.white54,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB48CFF),
          foregroundColor: Colors.white,
        ),
      ),

      iconTheme: const IconThemeData(color: Colors.white70),

      useMaterial3: true,
    );
  }
}
