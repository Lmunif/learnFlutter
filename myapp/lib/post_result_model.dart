import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResult {
  final int id;
  final String firstName;
  final String lastName;
  final String age;

  PostResult({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      id: object['id'],
      firstName: object['firstName'],
      lastName: object['lastName'],
      age: object['age'],
    );
  }

  static Future<PostResult> connectToAPI(
    String firstName, String lastName, String age) async {
    String apiURL = "https://dummyjson.com/users/add";

    var apiResult = await http.post(
      Uri.parse(apiURL),
      headers: {'Content-Type': 'application/json'},
      body: json
          .encode({"firstName": firstName, "lastName": lastName, "age": age}),
    );

    if (apiResult.statusCode == 201) {
      var jsonObject = json.decode(apiResult.body);
      return PostResult.createPostResult(jsonObject);
    } else {
      throw Exception("Failed to post data: ${apiResult.statusCode}");
    }
  }
}
