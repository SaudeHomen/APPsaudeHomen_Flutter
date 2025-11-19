import 'package:flutter/material.dart';
import '../services/theme_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late Map<String, dynamic> usuario;

  List<Map<String, dynamic>> _getDoencasPorIdade(int idade) {
    if (idade >= 10 && idade <= 20) {
      return [
        {
          'titulo': 'Ansiedade',
          'icone': Icons.psychology_alt,
          'descricaoCurta': 'Comum no período escolar e mudanças emocionais.',
          'descricaoLonga':
              'A ansiedade atinge muitos jovens por pressões sociais, escola e hormônios. Pode causar insônia e dificuldade de concentração.',
          'especialista': 'Psicólogo'
        },
        {
          'titulo': 'Obesidade Juvenil',
          'icone': Icons.fastfood,
          'descricaoCurta': 'Pode gerar diabetes e problemas cardíacos no futuro.',
          'descricaoLonga':
              'Sedentarismo e má alimentação aumentam risco de diabetes, hipertensão e problemas articulares.',
          'especialista': 'Nutricionista'
        },
        {
          'titulo': 'Acne Crônica',
          'icone': Icons.face_retouching_natural,
          'descricaoCurta': 'Alterações hormonais causam inflamação severa.',
          'descricaoLonga':
              'A acne surge por hormônios, oleosidade e bactérias. Tratamento precoce evita cicatrizes.',
          'especialista': 'Dermatologista'
        },
        {
          'titulo': 'Déficit de Vitamina D',
          'icone': Icons.wb_sunny,
          'descricaoCurta': 'A falta de sol impacta ossos e imunidade.',
          'descricaoLonga':
              'Tempo em ambientes fechados reduz vitamina D, afetando humor, imunidade e saúde óssea.',
          'especialista': 'Clínico Geral'
        },
      ];
    }

    // (restante igual)
    if (idade >= 21 && idade <= 30) {
      return [
        {
          'titulo': 'Depressão',
          'icone': Icons.sentiment_dissatisfied,
          'descricaoCurta': 'Comum por pressão profissional e emocional.',
          'descricaoLonga':
              'Sobrecarga emocional, noites mal dormidas e incertezas podem causar desmotivação e isolamento.',
          'especialista': 'Psicólogo / Psiquiatra'
        },
        {
          'titulo': 'Sedentarismo',
          'icone': Icons.sports_gymnastics,
          'descricaoCurta': 'Aumenta risco de obesidade e doenças cardíacas.',
          'descricaoLonga':
              'Falta de exercício reduz saúde cardiovascular, aumentando risco de diabetes e dores musculares.',
          'especialista': 'Educador físico'
        },
        {
          'titulo': 'Gastrite',
          'icone': Icons.local_fire_department,
          'descricaoCurta': 'Estresse, café e álcool podem inflamar o estômago.',
          'descricaoLonga':
              'Queimação e dor ligadas a má alimentação, stress e uso de anti-inflamatórios.',
          'especialista': 'Gastroenterologista'
        },
        {
          'titulo': 'Enxaqueca',
          'icone': Icons.bolt,
          'descricaoCurta': 'Cefaleias fortes dificultam rotina.',
          'descricaoLonga':
              'Desencadeada por luz, sono irregular e certos alimentos. Tratamento reduz episódios.',
          'especialista': 'Neurologista'
        },
      ];
    }

    // 31-40 / 41-50 / 51+ (mesmo código que você já tinha)
    // ...

    return [];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final textPrimary = theme.textTheme.bodyLarge?.color ?? Colors.white;

    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    usuario = args?['usuario'] ?? {};
    final nome = usuario['nome'] ?? "Usuário";
    final dataNascStr = usuario['dataNascimento'] ?? "1990-01-01";

    final dataNasc = DateTime.tryParse(dataNascStr) ?? DateTime(1990, 1, 1);
    final idade = DateTime.now().year - dataNasc.year;

    final doencas = _getDoencasPorIdade(idade);

    final bubbleColor = theme.colorScheme.primary;

    return Scaffold(
      body: CustomPaint(
        painter: BubbleBackgroundPainter(bubbleColor),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: ValueListenableBuilder(
                        valueListenable: themeNotifier,
                        builder: (_, ThemeMode mode, __) {
                          return Icon(
                            mode == ThemeMode.light ? Icons.wb_sunny : Icons.nights_stay,
                            color: primary,
                          );
                        },
                      ),
                      onPressed: toggleTheme,
                    ),
                    IconButton(
                      icon: Icon(Icons.logout, color: primary),
                      onPressed: () => Navigator.pushReplacementNamed(context, "/"),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  "Olá, $nome!",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "Idade: $idade anos",
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.textTheme.bodyMedium?.color?.withValues(alpha:.7),
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  "Estas são as doenças mais comuns na sua faixa etária:",
                  style: TextStyle(
                    color: theme.textTheme.bodyMedium?.color?.withValues(alpha:.7),
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: ListView.builder(
                    itemCount: doencas.length,
                    itemBuilder: (context, index) {
                      final d = doencas[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: primary.withValues(alpha:0.18),
                            width: 1.2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(d['icone'], size: 40, color: primary),
                            const SizedBox(width: 16),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    d['titulo'],
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: primary,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    d['descricaoCurta'],
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: textPrimary.withValues(alpha:0.7),
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primary,
                                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          title: Text(d['titulo'], style: theme.textTheme.titleLarge),
                                          content: Text(
                                            "${d['descricaoLonga']}\n\n👨‍⚕️ Especialista: ${d['especialista']}",
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context),
                                              child: const Text("Fechar"),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: const Text("ver mais", style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
        onTap: (i) {
          setState(() => _selectedIndex = i);
          if (i == 1) Navigator.pushNamed(context, '/profile', arguments: {"usuario": usuario});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}

class BubbleBackgroundPainter extends CustomPainter {
  final Color baseColor;
  BubbleBackgroundPainter(this.baseColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    paint.color = baseColor.withValues(alpha:.12);
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.1), 90, paint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.25), 110, paint);

    paint.color = baseColor.withValues(alpha:.10);
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.6), 70, paint);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.75), 80, paint);

    paint.color = baseColor.withValues(alpha:.08);
    canvas.drawCircle(Offset(size.width * 0.15, size.height * 0.8), 40, paint);
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.55), 35, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
