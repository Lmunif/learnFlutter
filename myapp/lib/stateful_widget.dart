import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
          title: const Text("Stateful Widget Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(number.toString(), style: TextStyle(fontSize: 10 + number.toDouble())),
              ElevatedButton(onPressed: TekanTombol, child: const Text("Tambah bilangan")),
              ElevatedButton(onPressed: KurangTombol, child: const Text("Kurang bilangan"))
            ],
          ),
        ),
      ),
    );
  }
}
