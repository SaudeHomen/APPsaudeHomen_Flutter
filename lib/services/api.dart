import 'dart:convert';
import 'package:flutter/foundation.dart'; // ← para usar debugPrint()
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.0.3:3000";

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

      debugPrint("LOGIN STATUS: ${response.statusCode}");
      debugPrint("LOGIN BODY: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }

      return null;
    } catch (e) {
      debugPrint("ERRO LOGIN: $e");
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

      debugPrint("CADASTRO STATUS: ${response.statusCode}");
      debugPrint("CADASTRO BODY: ${response.body}");

      return response.statusCode == 201;
    } catch (e) {
      debugPrint("ERRO AO CADASTRAR: $e");
      return false;
    }
  }
}
