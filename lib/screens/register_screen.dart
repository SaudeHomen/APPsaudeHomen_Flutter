import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/api.dart';
import '../widgets/bubble_background.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nomeCtrl = TextEditingController();
  final _cpfCtrl = TextEditingController();
  final _dataNascCtrl = TextEditingController();
  final _celularCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _senhaCtrl = TextEditingController();
  final _confirmarSenhaCtrl = TextEditingController();

  bool _loading = false;
  String? _error;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _error = null;
    });

    DateTime? data;
    try {
      data = DateFormat('dd/MM/yyyy').parseStrict(_dataNascCtrl.text);
    } catch (_) {}

    final dados = {
      "nome": _nomeCtrl.text.trim(),
      "email": _emailCtrl.text.trim().toLowerCase(),
      "senha": _senhaCtrl.text,
      "cpf": _cpfCtrl.text.trim(),
      "celular": _celularCtrl.text.trim(),
      "dataNascimento":
          data != null ? DateFormat('yyyy-MM-dd').format(data) : null,
    };

    try {
      final sucesso = await ApiService.registrarUsuario(dados);
      if (!mounted) return;

      if (sucesso) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Cadastro realizado com sucesso!')));
        Navigator.pushReplacementNamed(context, '/');
      } else {
        setState(() {
          _error =
              'Erro ao realizar cadastro. Verifique os dados ou se o e-mail/CPF já estão cadastrados.';
        });
      }
    } catch (e) {
      if (mounted) setState(() => _error = 'Falha ao conectar ao servidor.');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: CustomPaint(
        painter: BubbleBackgroundPainter(primary),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppBar(
                    title: const Text('Cadastro'),
                    backgroundColor: Colors.transparent,
                    foregroundColor: primary,
                    elevation: 0,
                    automaticallyImplyLeading: true,
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _nomeCtrl,
                    decoration: const InputDecoration(labelText: 'Nome completo'),
                    validator: (v) => v == null || v.isEmpty ? 'Informe seu nome' : null,
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    controller: _cpfCtrl,
                    decoration: const InputDecoration(labelText: 'CPF'),
                    keyboardType: TextInputType.number,
                    validator: (v) => v == null || v.isEmpty ? 'Informe seu CPF' : null,
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    controller: _dataNascCtrl,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Data de Nascimento',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () async {
                      final hoje = DateTime.now();
                      DateTime? dataSelecionada = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1900),
                        lastDate: hoje,
                      );
                      if (dataSelecionada != null) {
                        _dataNascCtrl.text =
                            DateFormat('dd/MM/yyyy').format(dataSelecionada);
                      }
                    },
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Informe sua data de nascimento' : null,
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    controller: _celularCtrl,
                    decoration: const InputDecoration(labelText: 'Celular'),
                    keyboardType: TextInputType.phone,
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Informe seu celular' : null,
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    controller: _emailCtrl,
                    decoration: const InputDecoration(labelText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) =>
                        v == null || !v.contains('@') ? 'Informe um e-mail válido' : null,
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    controller: _senhaCtrl,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                    validator: (v) =>
                        v == null || v.length < 4 ? 'Senha mínima de 4 caracteres' : null,
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    controller: _confirmarSenhaCtrl,
                    decoration: const InputDecoration(labelText: 'Confirmar Senha'),
                    obscureText: true,
                    validator: (v) =>
                        v != _senhaCtrl.text ? 'As senhas não coincidem' : null,
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _loading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                      ),
                      child: _loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Cadastrar',
                              style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),

                  const SizedBox(height: 16),

                  GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context, '/'),
                    child: Center(
                      child: Text(
                        'Já tem uma conta? Entrar',
                        style: TextStyle(
                            color: primary,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  if (_error != null) ...[
                    const SizedBox(height: 12),
                    Text(_error!, style: const TextStyle(color: Colors.red)),
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
