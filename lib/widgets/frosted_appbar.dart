import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedAppBar extends StatelessWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onBack;

  const FrostedAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Cor do fundo do appbar (tema claro e escuro)
    final barColor = isDark
        ? Colors.white.withValues(alpha: 0.07)
        : Colors.black.withValues(alpha: 0.06);

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          width: double.infinity,
          decoration: BoxDecoration(
            color: barColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              /// BOTÃO DE VOLTAR
              if (showBack)
                GestureDetector(
                  onTap: onBack ?? () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 26,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),

              if (showBack) const SizedBox(width: 12),

              /// TÍTULO CENTRALIZADO
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
              ),

              /// Espaço reservado para balancear visualmente quando há seta
              if (showBack)
                const SizedBox(
                  width: 38, // mesmo espaço aproximado do ícone da seta
                ),
            ],
          ),
        ),
      ),
    );
  }
}
