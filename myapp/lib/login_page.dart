import 'package:flutter/material.dart';
import 'package:myapp/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("LOGIN"),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) {
                  return const MainPage();
                }));
          },
        ),
      ),
    );
  }
}
