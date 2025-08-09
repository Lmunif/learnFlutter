import 'package:flutter/material.dart';
import 'package:myapp/post_result_model.dart';
import 'package:myapp/user_model.dart';
import 'package:flutter/services.dart'; // <-- Tambahkan ini di bagian atas

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult? postResult;
  User? userResult;

  // Controller untuk inputan
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _idController =
      TextEditingController(); // <-- Tambahan

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("API Demo")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: "First Name"),
              ),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: "Last Name"),
              ),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String fname = _firstNameController.text;
                  String lname = _lastNameController.text;
                  String age = _ageController.text;

                  if (fname.isNotEmpty && lname.isNotEmpty && age.isNotEmpty) {
                    PostResult.connectToAPI(fname, lname, age).then((value) {
                      setState(() {
                        postResult = value;
                      });
                    });
                  }
                },
                child: const Text("POST"),
              ),
              const Divider(),
              TextField(
                controller: _idController,
                decoration:
                    const InputDecoration(labelText: "User ID (for GET)"),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Hanya angka
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  String id = _idController.text;
                  if (id.isNotEmpty) {
                    User.connectToAPI(id).then((value) {
                      setState(() {
                        userResult = value;
                      });
                    }).catchError((e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Gagal mengambil data: $e")),
                      );
                    });
                  }
                },
                child: const Text("GET"),
              ),
              const SizedBox(height: 24),
              Text(
                postResult != null
                    ? 'Post ->R ${postResult!.id} | ${postResult!.firstName} | ${postResult!.lastName} | ${postResult!.age}'
                    : 'Tidak ada data Post',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                userResult != null
                    ? 'Get -> ${userResult!.id} | ${userResult!.name}'
                    : 'Tidak ada data Get',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
