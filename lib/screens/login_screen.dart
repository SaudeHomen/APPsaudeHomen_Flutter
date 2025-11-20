import 'package:flutter/material.dart';
import '../services/api.dart';
import '../widgets/bubble_background.dart';

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

    final usuario = await ApiService.login(
      _emailCtrl.text.trim(),
      _senhaCtrl.text.trim(),
    );

    if (!mounted) return;

    if (usuario != null) {
      Navigator.pushReplacementNamed(context, '/home', arguments: usuario);
    } else {
      setState(() => _error = "Credenciais inválidas");
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : const Color(0xFF395B8C);

    final subTextColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white70
        : Colors.black54;

    return Scaffold(
      body: BubbleBackground(
        color: primary,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // LOGO + TÍTULO – FIXO NO CANTO E ALINHADO COM O TEXTO
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        // LOGO
                        SizedBox(
                          height: 150, // aumentar ou diminuir a logo
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(width: 12),

                        // TÍTULO ALINHADO NO CENTRO DA LOGO
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "VIVA",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            Text(
                              "MAIS HOMEM",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // SUBTÍTULO ALINHADO DIRETAMENTE EMBAIXO
                  Text(
                    'Cuide de você,\nprevina-se e viva melhor',
                    style: TextStyle(
                      fontSize: 14,
                      color: subTextColor,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // EMAIL
                  TextFormField(
                    controller: _emailCtrl,
                    decoration: const InputDecoration(
                      labelText: "E-mail",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (v) =>
                        v == null || !v.contains("@") ? "E-mail inválido" : null,
                  ),

                  const SizedBox(height: 16),

                  // SENHA
                  TextFormField(
                    controller: _senhaCtrl,
                    decoration: const InputDecoration(
                      labelText: "Senha",
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    obscureText: true,
                    validator: (v) =>
                        v == null || v.isEmpty ? "Informe a senha" : null,
                  ),

                  const SizedBox(height: 30),

                  // BOTÃO ENTRAR
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _loading ? null : _submit,
                      child: _loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Entrar",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // LINK CADASTRO
                  Center(
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/register'),
                      child: Text(
                        "Não tem uma conta? Cadastre-se",
                        style: TextStyle(
                          color: primary,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  if (_error != null) ...[
                    const SizedBox(height: 20),
                    Text(
                      _error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
