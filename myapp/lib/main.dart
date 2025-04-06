import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context); // 👉 simpan MediaQuery dalam variabel

    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Media Query"),
      ),
      body: (mediaQuery.orientation != Orientation.portrait)
          ? Row(
              children: generateContainer,
            )
          : Column(
              children: generateContainer,
            ),
    );
  }

  List<Widget> get generateContainer {
    return [
      Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
      Container(
        color: Colors.green,
        width: 100,
        height: 100,
      ),
      Container(
        color: Colors.blue,
        width: 100,
        height: 100,
      ),
    ];
  }
}
