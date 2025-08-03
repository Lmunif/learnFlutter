import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResult {
  final String id;
  final String name;
  final String job;
  final String created;

  PostResult({
    required this.id,
    required this.name,
    required this.job,
    required this.created,
  });

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      created: object['createdAt'],
    );
  }

  static Future<PostResult> connectToAPI(String name, String job) async {
    String apiURL = "https://reqres.in/api/users";

    var apiResult = await http.post(
      Uri.parse(apiURL),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"name": name, "job": job}),
    );

    if (apiResult.statusCode == 201) {
      var jsonObject = json.decode(apiResult.body);
      return PostResult.createPostResult(jsonObject);
    } else {
      throw Exception("Failed to post data: ${apiResult.statusCode}");
    }
  }
}
