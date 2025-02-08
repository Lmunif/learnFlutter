import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Latihan Image"),
        ),
        body: Center(
          child: Container(
            color: Colors.black,
            width: 200,
            height: 200,
            padding: EdgeInsets.all(3),
            child: Image(
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
