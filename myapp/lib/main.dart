import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
int number = 0;
  void TekanTombol(){
    setState(() {
      number = number + 1;
    });
  }
  void KurangTombol(){
    setState(() {
      number = number - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateful Widget Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(number.toString(), style: TextStyle(fontSize: 10 + number.toDouble())),
              ElevatedButton(onPressed: TekanTombol, child: Text("Tambah bilangan")),
              Text("  "),
              ElevatedButton(onPressed: KurangTombol, child: Text("Kurang bilangan"))
            ],
          ),
        ),
      ),
    );
  }
}
