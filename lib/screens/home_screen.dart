import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Exemplo de doenças com especialistas recomendados
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
          'descricao':
              'Uma condição que afeta o metabolismo da glicose e pode causar danos se não for controlada.',
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
          'descricao':
              'Tipo de câncer mais comum entre os homens acima dos 50 anos. O diagnóstico precoce é essencial.',
          'especialista': 'Urologista'
        },
        {
          'titulo': 'Diabetes',
          'descricao':
              'Uma condição que afeta o metabolismo da glicose e pode causar sérios danos se não for controlada.',
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
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final nome = args?['nome'] ?? 'Usuário';
    final dataNascStr = args?['dataNascimento'] ?? '1990-01-01';

    // Calcula idade a partir da data de nascimento
    final dataNasc = DateTime.tryParse(dataNascStr) ?? DateTime(1990, 1, 1);
    final idade = DateTime.now().year - dataNasc.year;
    final doencas = _getDoencasPorIdade(idade);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Olá, $nome!',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Essas são as doenças mais comuns na sua faixa etária:',
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: doencas.length,
                  itemBuilder: (context, index) {
                    final d = doencas[index];
                    return Card(
                      color: const Color(0xFFF8F9FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              d['titulo']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              d['descricao']!,
                              style: const TextStyle(color: Colors.black54),
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      title: Text(d['titulo']!),
                                      content: Text(
                                        '${d['descricao']!}\n\n👨‍⚕️ Especialista recomendado: ${d['especialista']!}',
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
                                child: const Text('Ver mais'),
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
    );
  }
}
