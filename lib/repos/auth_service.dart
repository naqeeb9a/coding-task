import 'dart:convert';

import 'package:coding_task/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl =
      "https://jsonplaceholder.typicode.com"; // Free fake Api

  Future<UserModel> registerUser(String email, String password) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/users"),
      body: json.encode({
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () => throw Exception(
          'Check your internet connection. Make sure you have a stable connection.'),
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register user');
    }
  }
}
