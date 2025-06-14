import 'package:flutter/material.dart';
import 'package:myapp/colorful_button_kepsy.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Colorful Button"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorfulButton(Colors.pink, Colors.blue, Icons.adb),
              ColorfulButton(Colors.amber, Colors.orange, Icons.comment),
              ColorfulButton(Colors.green, Colors.purple, Icons.local_laundry_service),
              ColorfulButton(Colors.yellow, Colors.red, Icons.linked_camera)
            ],
          ),
        ),
      ),
    );
  }
}