import 'package:flutter/material.dart';
import 'package:myapp/user_model2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserSearch? userResult;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("API DEMO"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              userResult == null
                  ? const Text("No Data")
                  : Expanded(
                      child: ListView.builder(
                        itemCount: userResult!.users.length,
                        itemBuilder: (context, index) {
                          final user = userResult!.users[index];
                          return ListTile(
                            leading: Text(user.id.toString()),
                            title: Text("${user.firstName} ${user.lastName}"),
                            subtitle: Text("Age: ${user.age}"),
                          );
                        },
                      ),
                    ),
              ElevatedButton(
                onPressed: () {
                  UserSearch.connectToAPIList("john").then((value) {
                    setState(() {
                      userResult = value;
                    });
                  }).catchError((e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Gagal mengambil data: $e")),
                    );
                  });
                },
                child: const Text("Get"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
