import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static const String baseUrl = "http://192.168.0.3:3000";

  // Para emulador Android, use:
  // static const String baseUrl = "http://10.0.2.2:3000";

  // ============================
  // LOGIN → RETORNA USUÁRIO
  // ============================
  static Future<Map<String, dynamic>?> login(
      String email, String senha) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "senha": senha,
        }),
      );

      print("LOGIN STATUS: ${response.statusCode}");
      print("LOGIN BODY: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body); // ← retorna usuário do backend
      }

      return null;
    } catch (e) {
      print("ERRO LOGIN: $e");
      return null;
    }
  }

  // ============================
  // CADASTRAR USUÁRIO
  // ============================
  static Future<bool> registrarUsuario(Map<String, dynamic> dados) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(dados),
      );

      print("CADASTRO STATUS: ${response.statusCode}");
      print("CADASTRO BODY: ${response.body}");

      return response.statusCode == 201;
    } catch (e) {
      print("ERRO AO CADASTRAR: $e");
      return false;
    }
  }
}
