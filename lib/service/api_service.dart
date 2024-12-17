import 'dart:convert';
import 'package:bbu_midterm/modle/user.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static const String baseUrl = 'http://192.168.56.1:8080/API-PHP/api_123/user_api.php';

  // Fetch user data
  static Future<User> fetchUserData() async {
    final response = await http.get(Uri.parse('$baseUrl?action=get_user'));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user data');
    }
  }

  // Update user data
  static Future<String> updateUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl?action=update_user'),
      body: user.toJson(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw Exception('Failed to update user data');
    }
  }
}
