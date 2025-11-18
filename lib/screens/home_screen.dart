import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // ============================================================
  // DOENÇAS + ÍCONES ESPECÍFICOS POR FAIXA ETÁRIA
  // ============================================================
  List<Map<String, dynamic>> _getDoencasPorIdade(int idade) {
    // ************* 10–20 ANOS *************
    if (idade >= 10 && idade <= 20) {
      return [
        {
          'titulo': 'Ansiedade',
          'icone': Icons.psychology_alt,
          'descricaoCurta': 'Comum no período escolar e mudanças emocionais.',
          'descricaoLonga':
              'A ansiedade atinge muitos jovens por pressões sociais, escola, desempenho e hormônios. Pode causar insônia, irritabilidade e dificuldade de concentração.',
          'especialista': 'Psicólogo'
        },
        {
          'titulo': 'Obesidade Juvenil',
          'icone': Icons.fastfood,
          'descricaoCurta': 'Pode gerar diabetes e problemas cardíacos no futuro.',
          'descricaoLonga':
              'O sedentarismo e a má alimentação tornam a obesidade juvenil um risco crescente. Pode evoluir para diabetes, hipertensão e doenças articulares.',
          'especialista': 'Nutricionista'
        },
        {
          'titulo': 'Acne Crônica',
          'icone': Icons.face_retouching_natural,
          'descricaoCurta': 'Alterações hormonais causam inflamação severa.',
          'descricaoLonga':
              'A acne surge por hormônios, oleosidade e bactérias. Tratamento precoce evita manchas e cicatrizes.',
          'especialista': 'Dermatologista'
        },
        {
          'titulo': 'Déficit de Vitamina D',
          'icone': Icons.wb_sunny,
          'descricaoCurta': 'A falta de sol impacta ossos e imunidade.',
          'descricaoLonga':
              'Muito tempo em ambientes fechados reduz os níveis de vitamina D, afetando humor, imunidade e saúde óssea.',
          'especialista': 'Clínico Geral'
        },
      ];
    }

    // ************* 21–30 ANOS *************
    if (idade >= 21 && idade <= 30) {
      return [
        {
          'titulo': 'Depressão',
          'icone': Icons.sentiment_dissatisfied,
          'descricaoCurta': 'Comum por pressão profissional e emocional.',
          'descricaoLonga':
              'A depressão surge com sobrecarga emocional, noites mal dormidas e incertezas da vida adulta. Afeta energia e motivação.',
          'especialista': 'Psicólogo / Psiquiatra'
        },
        {
          'titulo': 'Sedentarismo',
          'icone': Icons.sports_gymnastics,
          'descricaoCurta': 'Aumenta risco de obesidade e doenças cardíacas.',
          'descricaoLonga':
              'A falta de exercícios reduz a saúde cardiovascular e favorece dores musculares, cansaço excessivo e ganho de peso.',
          'especialista': 'Educador físico'
        },
        {
          'titulo': 'Gastrite',
          'icone': Icons.local_fire_department,
          'descricaoCurta': 'Estresse, café e álcool podem inflamar o estômago.',
          'descricaoLonga':
              'Queimação, dor e má digestão são sintomas ligados a ansiedade, alimentação ruim e uso de anti-inflamatórios.',
          'especialista': 'Gastroenterologista'
        },
        {
          'titulo': 'Enxaqueca',
          'icone': Icons.bolt,
          'descricaoCurta': 'Cefaleias fortes dificultam rotina.',
          'descricaoLonga':
              'A enxaqueca é desencadeada por luz forte, estresse, sono irregular e certos alimentos.',
          'especialista': 'Neurologista'
        },
      ];
    }

    // ************* 31–40 ANOS *************
    if (idade >= 31 && idade <= 40) {
      return [
        {
          'titulo': 'Hipertensão inicial',
          'icone': Icons.monitor_heart,
          'descricaoCurta': 'Pressão começa a subir silenciosamente.',
          'descricaoLonga':
              'O excesso de estresse, sal na dieta e sedentarismo contribuem para o aumento gradual da pressão arterial.',
          'especialista': 'Cardiologista'
        },
        {
          'titulo': 'Colesterol alto',
          'icone': Icons.water_drop,
          'descricaoCurta': 'Aumenta risco de infarto e AVC.',
          'descricaoLonga':
              'Gorduras acumuladas podem entupir artérias. Geralmente não apresenta sintomas.',
          'especialista': 'Cardiologista'
        },
        {
          'titulo': 'Pré-diabetes',
          'icone': Icons.bloodtype,
          'descricaoCurta': 'Alterações no açúcar por má alimentação.',
          'descricaoLonga':
              'O corpo reduz a resposta à insulina. Sem cuidados, evolui rapidamente para diabetes.',
          'especialista': 'Endocrinologista'
        },
        {
          'titulo': 'Dor lombar crônica',
          'icone': Icons.accessibility_new,
          'descricaoCurta': 'Muito comum pelo excesso de trabalho sentado.',
          'descricaoLonga':
              'Má postura e falta de fortalecimento na musculatura geram dores persistentes.',
          'especialista': 'Ortopedista / Fisioterapeuta'
        },
      ];
    }

    // ************* 41–50 ANOS *************
    if (idade >= 41 && idade <= 50) {
      return [
        {
          'titulo': 'Diabetes tipo 2',
          'icone': Icons.bloodtype,
          'descricaoCurta': 'Comum nessa idade, especialmente com histórico familiar.',
          'descricaoLonga':
              'A resistência à insulina aumenta e pode trazer complicações renais, visuais e cardíacas.',
          'especialista': 'Endocrinologista'
        },
        {
          'titulo': 'Hipertensão',
          'icone': Icons.favorite,
          'descricaoCurta': 'Pressão alta pode danificar órgãos importantes.',
          'descricaoLonga':
              'Eleva risco de AVC, infarto, insuficiência cardíaca e problemas renais.',
          'especialista': 'Cardiologista'
        },
        {
          'titulo': 'Apneia do sono',
          'icone': Icons.bedtime,
          'descricaoCurta': 'Pausas na respiração geram cansaço e riscos à saúde.',
          'descricaoLonga':
              'Pode causar ronco intenso, dores de cabeça, sonolência e problemas cardíacos.',
          'especialista': 'Pneumologista'
        },
        {
          'titulo': 'Gota',
          'icone': Icons.spa,
          'descricaoCurta': 'Inflamação nas articulações causada por ácido úrico.',
          'descricaoLonga':
              'A gota provoca dor intensa e inchaço, geralmente nos pés.',
          'especialista': 'Reumatologista'
        },
      ];
    }

    // ************* 51+ ANOS *************
    return [
      {
        'titulo': 'Câncer de Próstata',
        'icone': Icons.male,
        'descricaoCurta': 'Comum após os 50. Exames são essenciais.',
        'descricaoLonga':
            'É silencioso no início, por isso a prevenção aumenta muito as chances de cura.',
        'especialista': 'Urologista'
      },
      {
        'titulo': 'Osteoporose',
        'icone': Icons.elderly,
        'descricaoCurta': 'Ossos mais fracos aumentam risco de fraturas.',
        'descricaoLonga':
            'A perda óssea acelera após os 50. Fraturas podem ocorrer facilmente.',
        'especialista': 'Ortopedista'
      },
      {
        'titulo': 'Artrite',
        'icone': Icons.back_hand,
        'descricaoCurta': 'Inflama as articulações e reduz a mobilidade.',
        'descricaoLonga':
            'Causa dor, rigidez e limitações articulares, afetando atividades do dia a dia.',
        'especialista': 'Reumatologista'
      },
      {
        'titulo': 'Insuficiência cardíaca leve',
        'icone': Icons.heart_broken,
        'descricaoCurta': 'Coração fica mais fraco com a idade.',
        'descricaoLonga':
            'Cansaço, falta de ar e inchaço nas pernas podem surgir.',
        'especialista': 'Cardiologista'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final usuario = args?['usuario'] ?? {};

    final nome = usuario['nome'] ?? 'Usuário';
    final dataNascStr = usuario['dataNascimento'] ?? '1990-01-01';

    final dataNasc = DateTime.tryParse(dataNascStr) ?? DateTime(1990, 1, 1);
    final idade = DateTime.now().year - dataNasc.year;

    final doencas = _getDoencasPorIdade(idade);

    return Scaffold(
      body: CustomPaint(
        painter: BubbleBackgroundPainter(),  // 🎨 FUNDO COM BOLHAS SUAVES
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ----------------------- Logout
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.logout, color: Color(0xFF395B8C)),
                    onPressed: () => Navigator.pushReplacementNamed(context, "/"),
                  ),
                ),

                const SizedBox(height: 10),

                // ----------------------- Saudação
                Text(
                  'Olá, $nome!',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color(0xFF395B8C),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 3),

                // ----------------------- Idade
                Text(
                  'Idade: $idade anos',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                // ----------------------- Subtítulo
                Text(
                  'Estas são as doenças mais comuns na sua faixa etária, fique precavido!:',
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),

                const SizedBox(height: 20),

                // ----------------------- LISTA
                Expanded(
                  child: ListView.builder(
                    itemCount: doencas.length,
                    itemBuilder: (context, index) {
                      final d = doencas[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: primary.withValues(alpha: 0.25), // 🎨 nova borda elegante
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(d['icone'], size: 40, color: primary),

                            const SizedBox(width: 16),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    d['titulo'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF395B8C),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    d['descricaoCurta'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primary,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 22, vertical: 10),
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
                                          title: Text(d['titulo']),
                                          content: Text(
                                            '${d['descricaoLonga']}\n\n👨‍⚕️ Especialista recomendado: ${d['especialista']}',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context),
                                              child: const Text('Fechar'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'ver mais',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
          if (i == 1) Navigator.pushNamed(context, '/profile');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

// ================================================================
// 🎨 PAINTER DO FUNDO COM BOLHAS SUAVES (OPÇÃO 4)
// ================================================================
class BubbleBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFBFA8E5).withValues(alpha: 0.12)
      ..style = PaintingStyle.fill;

    // Bolhas grandes
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.1), 90, paint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.25), 110, paint);

    // Bolhas médias
    paint.color = const Color(0xFFBFA8E5).withValues(alpha: 0.10);
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.6), 70, paint);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.75), 80, paint);

    // Bolhas pequenas
    paint.color = const Color(0xFFBFA8E5).withValues(alpha: 0.08);
    canvas.drawCircle(Offset(size.width * 0.15, size.height * 0.8), 40, paint);
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.55), 35, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
