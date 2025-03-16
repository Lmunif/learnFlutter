import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// test
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.adb,
            color: Colors.white,
          ),
          title: const Text(
            "Appbar Example",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {},
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff0096ff), Color(0xff6610f2)],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                ),
                image: DecorationImage(
                    image: AssetImage("images/kucing.jpg"),
                    fit: BoxFit.fitWidth,
                    repeat: ImageRepeat.repeat)),
          ),
        ),
      ),
    );
  }
}
