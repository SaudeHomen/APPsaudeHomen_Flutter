import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.0.2:3000";

  // ============================
  // LOGIN
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

  // ============================
  // ATUALIZAR USUÁRIO
  // ============================
  static Future<Map<String, dynamic>?> atualizarUsuario(
      String id, Map<String, dynamic> dados) async {
    try {
      final response = await http.put(
        Uri.parse("$baseUrl/usuario/$id"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(dados),
      );

      debugPrint("UPDATE STATUS: ${response.statusCode}");
      debugPrint("UPDATE BODY: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }

      return null;
    } catch (e) {
      debugPrint("ERRO ATUALIZAR USUÁRIO: $e");
      return null;
    }
  }
}
