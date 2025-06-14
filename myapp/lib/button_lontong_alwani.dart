import 'package:flutter/material.dart';
import 'package:myapp/colorful_button_alwani.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Colorful Buttons"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ColorfulButton(Colors.pink,Colors.blue,Icons.adb),
            ColorfulButton(Colors.deepPurpleAccent,Colors.green,Icons.face),
            ColorfulButton(Colors.blueGrey,Colors.orange,Icons.link_off_rounded),
            ColorfulButton(Colors.amber,Colors.purple,Icons.key),
          ],
        ),
      ),
    ));
  }
}
