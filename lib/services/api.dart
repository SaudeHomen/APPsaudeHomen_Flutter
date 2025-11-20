import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Atualize conforme seu IP/ambiente
  static const String baseUrl = "https://unfactorable-ependymal-major.ngrok-free.dev";

  // LOGIN
  static Future<Map<String, dynamic>?> login(String email, String senha) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "senha": senha}),
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

  // CADASTRO
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

  // ATUALIZAR USUÁRIO (PUT /usuario/:id)
  static Future<Map<String, dynamic>?> atualizarUsuario(
      String id, Map<String, dynamic> updates) async {
    try {
      final response = await http.put(
        Uri.parse("$baseUrl/usuario/$id"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(updates),
      );

      debugPrint("ATUALIZAR STATUS: ${response.statusCode}");
      debugPrint("ATUALIZAR BODY: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return null;
    } catch (e) {
      debugPrint("ERRO AO ATUALIZAR: $e");
      return null;
    }
  }
}
