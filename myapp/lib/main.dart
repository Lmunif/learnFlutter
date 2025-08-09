import 'package:flutter/material.dart';
import 'package:myapp/post_result_model.dart';

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

  // Controller untuk inputan
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

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
              const SizedBox(height: 24),
              Text(
                postResult != null
                    ? '${postResult!.id} | ${postResult!.firstName} | ${postResult!.lastName} | ${postResult!.age}'
                    : 'Tidak ada data',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
