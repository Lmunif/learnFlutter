import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: [
              buildCard(Icons.account_box, 'Account Box', Colors.blue, 7),
              buildCard(Icons.adb, 'Serangga Box', Colors.red, 11),
            ],
          ),
        ),
      ),
    );
  }
}

buildCard(
    IconData iconData, String text, Color colorIcons, double evaluations) {
  return Card(
    elevation: evaluations,
    child: Row(
      children: [
        Container(
            margin: EdgeInsets.all(5),
            child: Icon(
              iconData,
              color: colorIcons,
            )),
        Text(text)
      ],
    ),
  );
}
