import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Map<String, String>> _getDoencasPorIdade(int idade) {
    if (idade < 30) {
      return [
        {
          'titulo': 'Obesidade',
          'descricao': 'O excesso de peso pode causar vários problemas de saúde a longo prazo.',
          'especialista': 'Nutricionista ou Endocrinologista'
        },
        {
          'titulo': 'Depressão',
          'descricao': 'Distúrbio emocional que afeta o humor e pode impactar o bem-estar geral.',
          'especialista': 'Psicólogo ou Psiquiatra'
        },
      ];
    } else if (idade < 50) {
      return [
        {
          'titulo': 'Diabetes',
          'descricao': 'Alteração no metabolismo da glicose que pode causar danos se não tratada.',
          'especialista': 'Endocrinologista'
        },
        {
          'titulo': 'Hipertensão',
          'descricao':
              'Pressão arterial alta pode causar danos ao coração e vasos sanguíneos.',
          'especialista': 'Cardiologista'
        },
      ];
    } else {
      return [
        {
          'titulo': 'Câncer de Próstata',
          'descricao': 'Muito comum após os 50 anos. Diagnóstico precoce é essencial.',
          'especialista': 'Urologista'
        },
        {
          'titulo': 'Diabetes',
          'descricao': 'Alteração no metabolismo da glicose que pode causar danos graves.',
          'especialista': 'Endocrinologista'
        },
        {
          'titulo': 'Hipertensão',
          'descricao':
              'Pressão arterial alta pode causar danos ao coração e vasos sanguíneos.',
          'especialista': 'Cardiologista'
        },
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    // ===============================
    // RECEBENDO DADOS DO LOGIN
    // ===============================
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Agora o Flutter recebe assim:
    // { "message": "...", "usuario": {nome, email, dataNascimento...} }
    final usuario = args?['usuario'] ?? {};

    final nome = usuario['nome'] ?? 'Usuário';
    final dataNascStr = usuario['dataNascimento'] ?? '1990-01-01';

    // Calcula idade corretamente
    final dataNasc = DateTime.tryParse(dataNascStr) ?? DateTime(1990, 1, 1);
    final idade = DateTime.now().year - dataNasc.year;

    final doencas = _getDoencasPorIdade(idade);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F2FD),

      // ------------------------------------------
      // APP BAR COM BOTÃO DE LOGOUT NO CANTO DIREITO
      // ------------------------------------------
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Color(0xFF395B8C)),
            tooltip: "Sair",
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --------------------------
              // Saudação com nome real
              // --------------------------
              Text(
                'Olá, $nome!',
                style: const TextStyle(
                  fontSize: 22,
                  color: Color(0xFF395B8C),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                'Essas são as doenças mais comuns na sua idade, seja precavido!',
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),

              const SizedBox(height: 20),

              // --------------------------
              // Lista de doenças
              // --------------------------
              Expanded(
                child: ListView.builder(
                  itemCount: doencas.length,
                  itemBuilder: (context, index) {
                    final d = doencas[index];

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              d['titulo']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF395B8C),
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              d['descricao']!,
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
                                elevation: 2,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    title: Text(d['titulo']!),
                                    content: Text(
                                      '${d['descricao']!}\n\n👨‍⚕️ Especialista recomendado: ${d['especialista']!}',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context),
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
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // ------------------------------------------
      // BOTTOM NAV BAR (APENAS ESTÉTICO POR ENQUANTO)
      // ------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
        elevation: 10,
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
