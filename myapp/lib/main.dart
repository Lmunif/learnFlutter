import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isObscured = true;
  String username = '';
  String password = '';

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  Future<void> sendData() async {
    final url = Uri.parse("https://dummyjson.com/auth/login?");
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print("Response: $responseData");
      _scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(content: Text("Berhasil Login!")),
      );
    } else {
      print("Error: ${response.statusCode}");
      _scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(content: Text("Gagal Login")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldMessengerKey, // Tambahkan ini
      home: Scaffold(
        appBar: AppBar(title: const Text("Latihan Text Field")),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.lightBlue[50],
                  filled: true,
                  prefixIcon: const Icon(Icons.person),
                  prefixText: "Name: ",
                  labelText: "Nama Lengkap",
                  hintText: "Nama Lengkapnya loh..",
                  hintStyle: const TextStyle(fontSize: 20),
                  prefixStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: isObscured,
                decoration: InputDecoration(
                  fillColor: Colors.lightBlue[50],
                  filled: true,
                  prefixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                    child: Icon(
                      isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  prefixText: "Password: ",
                  labelText: "Password",
                  hintText: "Password harus 5 karakter",
                  hintStyle: const TextStyle(fontSize: 20),
                  prefixStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: sendData,
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
