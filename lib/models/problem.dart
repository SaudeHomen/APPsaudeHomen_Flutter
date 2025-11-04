class Problem {
  final String nome;
  final String descricao;

  Problem({
    required this.nome,
    required this.descricao,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
      nome: json['nome'] ?? '',
      descricao: json['descricao'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'descricao': descricao,
      };
}
