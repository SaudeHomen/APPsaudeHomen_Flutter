import 'package:flutter/material.dart';

/// Gerencia o tema em tempo de execução (não persistente).
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void toggleTheme() {
  themeNotifier.value =
      themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
}
