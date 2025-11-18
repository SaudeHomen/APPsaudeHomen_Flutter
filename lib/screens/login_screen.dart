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
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final usuario = await ApiService.login(
        _emailCtrl.text.trim(),
        _senhaCtrl.text.trim(),
      );

      if (usuario != null && mounted) {
        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: usuario,
        );
      } else {
        setState(() => _error = "Credenciais inválidas");
      }
    } catch (e) {
      setState(() => _error = "Erro ao efetuar login");
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: const Color(0xFFF4EFFA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // LOGO + TÍTULO
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SAÚDE',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF395B8C),
                          ),
                        ),
                        Text(
                          'DO HOMEM',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF395B8C),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                const Text(
                  'Cuide de você,\nprevina-se e viva melhor',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 40),

                // EMAIL
                TextFormField(
                  controller: _emailCtrl,
                  decoration: const InputDecoration(
                    labelText: "E-mail",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                      v == null || !v.contains('@') ? "Email inválido" : null,
                ),

                const SizedBox(height: 16),

                // SENHA
                TextFormField(
                  controller: _senhaCtrl,
                  decoration: const InputDecoration(
                    labelText: "Senha",
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (v) =>
                      v == null || v.isEmpty ? "Informe a senha" : null,
                ),

                const SizedBox(height: 24),

                // BOTÃO LOGIN
                SizedBox(
                  width: double.infinity,
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
                            "Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 20),

                // LINK CADASTRAR
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/register');
                    },
                    child: Text(
                      'Não tem uma conta? Cadastre-se',
                      style: TextStyle(
                        color: primary,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

                if (_error != null) ...[
                  const SizedBox(height: 15),
                  Text(_error!, style: const TextStyle(color: Colors.red)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
