import 'package:flutter/material.dart';
import '../services/api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _senhaCtrl = TextEditingController();
  bool _loading = false;
  String? _error;

  Future<void> _submit() async {
    setState(() => _error = null);
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    try {
  final ok = await Api.loginFake(_emailCtrl.text.trim(), _senhaCtrl.text.trim());
  if (ok && mounted) {
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'nome': 'Usuário',
        'dataNascimento': '1985-06-14', // valor temporário
      },
    );
  } else {
    setState(() => _error = 'Credenciais inválidas');
  }
} catch (e) {
  setState(() => _error = 'Erro ao efetuar login');
} finally {
  setState(() => _loading = false);
}
  }

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF395B8C); // azul fixo para consistência
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.medical_services, color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'SAÚDE\nDO HOMEM',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1.2),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Cuide de você,\nprevina-se e viva melhor',
                style: textTheme.bodyMedium?.copyWith(color: Colors.black54, height: 1.4),
              ),
              const SizedBox(height: 40),

              // Formulário
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _emailCtrl,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) => v == null || v.isEmpty ? 'Informe o e-mail' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _senhaCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock_outline),
                      ),
                      validator: (v) =>
                          v == null || v.length < 4 ? 'Senha mínima 4 caracteres' : null,
                    ),
                    const SizedBox(height: 28),

                    // Botão Entrar
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _loading ? null : _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: _loading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                'Entrar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Link de cadastro
                    GestureDetector(
  onTap: () {
    Navigator.pushNamed(context, '/register');
  },
  child: Center(
    child: Text(
      'Não tem uma conta? Cadastre-se',
      style: TextStyle(
        color: primary,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
),

                    // Erro
                    if (_error != null) ...[
                      const SizedBox(height: 14),
                      Center(
                        child: Text(
                          _error!,
                          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
