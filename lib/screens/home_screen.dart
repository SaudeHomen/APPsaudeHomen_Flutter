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

  // ============================================================
  // 🔥 TODAS AS FAIXAS ETÁRIAS COMPLETAS
  // ============================================================
  List<Map<String, dynamic>> _getDoencasPorIdade(int idade) {
    // 10–20
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

    // 21–30
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

    // 31–40
    if (idade >= 31 && idade <= 40) {
      return [
        {
          'titulo': 'Hipertensão inicial',
          'icone': Icons.monitor_heart,
          'descricaoCurta': 'Pressão começa a subir silenciosamente.',
          'descricaoLonga':
              'Estresse, excesso de sal e sedentarismo contribuem para aumento gradual da pressão.',
          'especialista': 'Cardiologista'
        },
        {
          'titulo': 'Colesterol alto',
          'icone': Icons.water_drop,
          'descricaoCurta': 'Aumenta risco de infarto e AVC.',
          'descricaoLonga':
              'Acúmulo de gorduras pode entupir artérias. Geralmente assintomático.',
          'especialista': 'Cardiologista'
        },
        {
          'titulo': 'Pré-diabetes',
          'icone': Icons.bloodtype,
          'descricaoCurta': 'Alterações no açúcar por má alimentação.',
          'descricaoLonga':
              'Perda de sensibilidade à insulina que, sem controle, evolui para diabetes tipo 2.',
          'especialista': 'Endocrinologista'
        },
        {
          'titulo': 'Dor lombar crônica',
          'icone': Icons.accessibility_new,
          'descricaoCurta': 'Comum por trabalho sentado.',
          'descricaoLonga':
              'Má postura e fraqueza muscular causam dores persistentes; fisioterapia ajuda.',
          'especialista': 'Ortopedista / Fisioterapeuta'
        },
      ];
    }

    // 41–50
    if (idade >= 41 && idade <= 50) {
      return [
        {
          'titulo': 'Diabetes tipo 2',
          'icone': Icons.bloodtype,
          'descricaoCurta': 'Comum nessa idade, especialmente com histórico familiar.',
          'descricaoLonga':
              'Resistência à insulina que pode trazer complicações renais, visuais e cardíacas.',
          'especialista': 'Endocrinologista'
        },
        {
          'titulo': 'Hipertensão',
          'icone': Icons.favorite,
          'descricaoCurta': 'Pressão alta pode danificar órgãos.',
          'descricaoLonga':
              'Aumenta risco de AVC, infarto e insuficiência cardíaca se não controlada.',
          'especialista': 'Cardiologista'
        },
        {
          'titulo': 'Apneia do sono',
          'icone': Icons.bedtime,
          'descricaoCurta': 'Pausas na respiração geram cansaço.',
          'descricaoLonga':
              'Ronco forte, sonolência e risco cardíaco; tratamento com CPAP em muitos casos.',
          'especialista': 'Pneumologista'
        },
        {
          'titulo': 'Gota',
          'icone': Icons.spa,
          'descricaoCurta': 'Inflamação nas articulações causada por ácido úrico.',
          'descricaoLonga':
              'Crises dolorosas ligadas à alimentação rica em purinas e álcool; tratamento evita recidivas.',
          'especialista': 'Reumatologista'
        },
      ];
    }

    // 51+
    if (idade >= 51) {
      return [
        {
          'titulo': 'Câncer de Próstata',
          'icone': Icons.male,
          'descricaoCurta': 'Comum após os 50. Exames essenciais.',
          'descricaoLonga':
              'Geralmente silencioso no início. Rastreamento melhora chance de cura.',
          'especialista': 'Urologista'
        },
        {
          'titulo': 'Osteoporose',
          'icone': Icons.elderly,
          'descricaoCurta': 'Ossos fracos aumentam risco de fraturas.',
          'descricaoLonga':
              'Perda óssea com idade; prevenção com cálcio, vitamina D e exercícios.',
          'especialista': 'Ortopedista'
        },
        {
          'titulo': 'Artrite',
          'icone': Icons.back_hand,
          'descricaoCurta': 'Inflama as articulações e reduz mobilidade.',
          'descricaoLonga':
              'Dor e rigidez que afetam rotina; fisioterapia e medicação podem ajudar.',
          'especialista': 'Reumatologista'
        },
        {
          'titulo': 'Insuficiência cardíaca leve',
          'icone': Icons.heart_broken,
          'descricaoCurta': 'Coração fica mais fraco com a idade.',
          'descricaoLonga':
              'Cansaço, falta de ar e inchaço nas pernas; acompanhamento cardiológico obrigatório.',
          'especialista': 'Cardiologista'
        },
      ];
    }

    return [];
  }

  // ============================================================
  // INTERFACE (mesma que você já tinha)
  // ============================================================
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
                    color: theme.textTheme.bodyMedium?.color?.withValues(alpha: .7),
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  "Estas são as doenças mais comuns na sua faixa etária, seja precavido!",
                  style: TextStyle(
                    color: theme.textTheme.bodyMedium?.color?.withValues(alpha: .7),
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
                            color: primary.withValues(alpha: 0.18),
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
                                      color: textPrimary.withValues(alpha: 0.7),
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

    paint.color = baseColor.withValues(alpha: .12);
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.1), 90, paint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.25), 110, paint);

    paint.color = baseColor.withValues(alpha: .10);
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.6), 70, paint);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.75), 80, paint);

    paint.color = baseColor.withValues(alpha: .08);
    canvas.drawCircle(Offset(size.width * 0.15, size.height * 0.8), 40, paint);
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.55), 35, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
