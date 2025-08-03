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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("API Demo")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                postResult != null
                    ? '${postResult!.id} | ${postResult!.firstName} | ${postResult!.lastName} | ${postResult!.age}'
                    : 'Tidak ada datas',
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  PostResult.connectToAPI("alwani", "achmad", "25")
                      .then((value) {
                    setState(() {
                      postResult = value;
                    });
                  });
                },
                child: const Text("POST"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
