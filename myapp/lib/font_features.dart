import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Typography"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Contoh 01 (Tanpa Apapun)",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Contoh 02 (Small Caps)",
                style: TextStyle(
                    fontSize: 20, fontFeatures: [FontFeature.enable("smcp")]),
              ),
              Text(
                "Contoh 3 1/2 (Small Caps & Frac)",
                style: TextStyle(fontSize: 20, fontFeatures: [
                  FontFeature.enable("smcp"),
                  FontFeature.enable("frac")
                ]),
              ),
              Text(
                "Milonga 3 1/2 (Small Caps & Frac)",
                style: TextStyle(fontSize: 20, fontFamily: "Milonga", fontFeatures: [
                  FontFeature.enable("smcp"),
                  FontFeature.enable("frac")
                ]),
              ),
              Text(
                "Contoh Cardo 19 (Tanpa Apapun)",
                style: TextStyle(fontSize: 20, fontFamily: "Cardo"),
              ),
              Text(
                "Contoh Cardo 19 (Old Style)",
                style: TextStyle(fontSize: 20, fontFamily: "Cardo", fontFeatures: [
                  FontFeature.oldstyleFigures()
                ]),
              ),
              Text(
                "Gabriola (Default)",
                style: TextStyle(fontSize: 30, fontFamily: "Gabriola",),
              ),
              Text(
                "Gabriola (Style set nomor 7)",
                style: TextStyle(fontSize: 30, fontFamily: "Gabriola", fontFeatures: [
                  FontFeature.stylisticSet(7)
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
