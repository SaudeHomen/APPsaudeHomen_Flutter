import 'package:flutter/material.dart';
import '../services/api.dart';
import '../widgets/bubble_background.dart';
import '../widgets/frosted_appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _celularCtrl = TextEditingController();
  final TextEditingController _senhaCtrl = TextEditingController();

  late Map usuario; // <-- Guarda o usuário inteiro

  String cpf = "";
  String dataNascimento = "";
  String userId = "";

  bool _loading = false;
  String? _mensagem;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      usuario = args?['usuario'] ?? {};

      userId = usuario['id'] ?? "";
      cpf = usuario['cpf'] ?? "";
      dataNascimento = usuario['dataNascimento'] ?? "";

      _nomeCtrl.text = usuario['nome'] ?? "";
      _emailCtrl.text = usuario['email'] ?? "";
      _celularCtrl.text = usuario['celular'] ?? "";

      setState(() {});
    });
  }

  Future<void> _salvarAlteracoes() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _mensagem = null;
    });

    final dados = {
      "nome": _nomeCtrl.text.trim(),
      "email": _emailCtrl.text.trim(),
      "celular": _celularCtrl.text.trim(),
    };

    if (_senhaCtrl.text.trim().isNotEmpty) {
      dados["senha"] = _senhaCtrl.text.trim();
    }

    final resposta = await ApiService.atualizarUsuario(userId, dados);

    if (resposta != null) {
      // Atualiza no mapa para enviar certo ao voltar
      usuario['nome'] = dados["nome"];
      usuario['email'] = dados["email"];
      usuario['celular'] = dados["celular"];
    }

    setState(() {
      _loading = false;
      _mensagem = resposta != null
          ? "Dados atualizados com sucesso!"
          : "Erro ao atualizar dados!";
    });
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: BubbleBackground(
        color: primary,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                FrostedAppBar(
                  title: "Meu Perfil",
                  showBack: true,

                  /// 🔙 VOLTAR CORRIGIDO
                  onBack: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/home',
                      arguments: {"usuario": usuario},
                    );
                  },
                ),

                const SizedBox(height: 20),

                Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha:0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        campo("Nome completo", _nomeCtrl),
                        const SizedBox(height: 12),

                        campo("E-mail", _emailCtrl),
                        const SizedBox(height: 12),

                        campo("Celular", _celularCtrl),
                        const SizedBox(height: 12),

                        campoRead("CPF", cpf),
                        const SizedBox(height: 12),

                        campoRead("Data de Nascimento", dataNascimento),
                        const SizedBox(height: 12),

                        campo(
                          "Nova senha (opcional)",
                          _senhaCtrl,
                          isPassword: true,
                          obrigatorio: false,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                if (_mensagem != null)
                  Text(
                    _mensagem!,
                    style: TextStyle(
                      color: _mensagem!.contains("sucesso")
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _salvarAlteracoes,
                    child: _loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Salvar alterações"),
                  ),
                ),

                const SizedBox(height: 20),

                TextButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text(
                    "Sair da conta",
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget campo(String label, TextEditingController c,
      {bool isPassword = false, bool obrigatorio = true}) {
    return TextFormField(
      controller: c,
      obscureText: isPassword,
      decoration: InputDecoration(labelText: label),
      validator: (v) {
        if (!obrigatorio) return null;
        if (v == null || v.isEmpty) return "Campo obrigatório";
        return null;
      },
    );
  }

  Widget campoRead(String label, String value) {
    return TextFormField(
      initialValue: value,
      enabled: false,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.block),
      ),
    );
  }
}
