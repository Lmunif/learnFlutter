import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Image"),
        ),
        body: Center(
          child: Container(
            color: Colors.black,
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(3),
            child: const Image(
                image: NetworkImage(
                    "https://img.pikbest.com/background/20220119/simple-programmer-blue-background-poster_6221892.jpg!w700wp"),
                    fit: BoxFit.contain,
                    repeat: ImageRepeat.repeat,),
          ),
        ),
      ),
    );
  }
}
