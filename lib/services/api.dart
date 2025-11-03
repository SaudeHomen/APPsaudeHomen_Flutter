import 'dart:async';
import '../models/problem.dart';

class Api {
  // Simulação de login (retorna true se o email e senha não forem vazios)
  static Future<bool> loginFake(String email, String senha) async {
    await Future.delayed(const Duration(seconds: 1));
    return email.isNotEmpty && senha.isNotEmpty;
  }

  // Simulação de problemas (como se viessem do banco)
  static Future<List<Problem>> fetchProblems({int limit = 3}) async {
    await Future.delayed(const Duration(seconds: 1));
    final all = [
      Problem(
        nome: 'Câncer de Próstata',
        descricao:
            'É o tipo de câncer mais comum entre os homens, especialmente acima dos 50 anos. O diagnóstico precoce é essencial.',
      ),
      Problem(
        nome: 'Diabetes',
        descricao:
            'Uma condição que afeta o metabolismo da glicose e pode causar sérios danos à saúde se não for controlada.',
      ),
      Problem(
        nome: 'Hipertensão',
        descricao:
            'Pressão arterial alta pode causar danos ao coração e vasos sanguíneos. O acompanhamento médico é vital.',
      ),
      Problem(
        nome: 'Depressão',
        descricao:
            'Afeta o humor e a disposição, impactando diretamente a qualidade de vida. É importante buscar ajuda profissional.',
      ),
    ];
    return all.take(limit).toList();
  }
}
