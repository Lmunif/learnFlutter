import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String firstName;
  final String lastName;
  final int age;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      age: json["age"],
    );
  }
}

class UserSearch {
  final List<User> users;

  UserSearch({required this.users});

  factory UserSearch.fromJson(Map<String, dynamic> json) {
    var list = json["users"] as List;
    List<User> usersList = list.map((u) => User.fromJson(u)).toList();

    return UserSearch(users: usersList);
  }

  static Future<UserSearch> connectToAPIList(String search) async {
    final String apiURL = 'https://dummyjson.com/users/search?q=$search';

    try {
      final response = await http.get(Uri.parse(apiURL));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return UserSearch.fromJson(jsonData);
      } else {
        throw Exception("Failed to load user: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
