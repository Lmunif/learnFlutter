import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final String id;
  final String name;

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: "${json['firstName']} ${json['lastName']}",
    );
  }

  static Future<User> connectToAPI(String id) async {
    final String apiURL = 'https://dummyjson.com/users/$id';

    try {
      final response = await http.get(Uri.parse(apiURL));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return User.fromJson(jsonData);
      } else {
        throw Exception("Failed to load user: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
