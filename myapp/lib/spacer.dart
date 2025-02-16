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
          title: Text("Spacer Widged"),
        ),
        body: Center(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Spacer(flex: 1,),
              Container(width: 80,height: 80, color: Color.fromARGB(99, 190, 71, 71),),
              Spacer(flex: 2,),
              Container(width: 80,height: 80, color: Color.fromARGB(198, 205, 207, 84),),
              Spacer(flex: 3,),
              Container(width: 80,height: 80, color: Color.fromARGB(92, 9, 104, 228),),
              Spacer(flex: 2,),
            ],
          )
        ),
      ),
    );
  }
}
