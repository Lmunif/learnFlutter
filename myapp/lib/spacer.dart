import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Spacer Widged"),
        ),
        body: Center(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(flex: 1,),
              Container(width: 80,height: 80, color: const Color.fromARGB(99, 190, 71, 71),),
              const Spacer(flex: 2,),
              Container(width: 80,height: 80, color: const Color.fromARGB(198, 205, 207, 84),),
              const Spacer(flex: 3,),
              Container(width: 80,height: 80, color: const Color.fromARGB(92, 9, 104, 228),),
              const Spacer(flex: 2,),
            ],
          )
        ),
      ),
    );
  }
}
