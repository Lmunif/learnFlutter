import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random = Random();

  Timer? _timer; // Timer untuk interval


  @override
   void initState() {
    super.initState();
    _startInterval();
  }

    void _startInterval() {
    const intervalDuration = Duration(seconds: 5);
    _timer = Timer.periodic(intervalDuration, (Timer timer) {
      // Tugas yang dijalankan setiap interval
        setState(() {
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Animated Container"),
        ),
        body: Center(
          child: GestureDetector(
            child: AnimatedContainer(
              color: Color.fromARGB(255, random.nextInt(256),
                  random.nextInt(256), random.nextInt(256)),
              duration: const Duration(seconds: 1),
              width: 50.0 + random.nextInt(101),
              height: 50.0 + random.nextInt(101),
            ),
          ),
        ),
      ),
    );
  }
}
