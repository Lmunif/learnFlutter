import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/colorful_button_kepsy.dart';

//wowo joko
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gradient Opacity"),
        ),
        body: Center(
          child: ShaderMask(
            shaderCallback: (Rectangle) {
              return LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(
                  Rect.fromLTRB(0, 0, Rectangle.width, Rectangle.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image(
              width: 300,
              image: NetworkImage(
                  "https://asset.kompas.com/crops/VICCMGXd5-4OvZXv86fddaYF2rs=/0x0:0x0/750x500/data/photo/buku/63a2d1b523b50.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
