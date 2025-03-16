import 'package:flutter/material.dart';
import 'package:myapp/second_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Page"),),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Second Page"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
                  return const SecondPage();
                }));
          },
        ),
      ),
    );
  }
}