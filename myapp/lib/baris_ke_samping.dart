import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kolom Kesamping"),
        ),
        body: Row(
          // Gunakan Row untuk membuat layout horizontal
          mainAxisAlignment:
          MainAxisAlignment.spaceAround, // Atur jarak antar kolom
          crossAxisAlignment: CrossAxisAlignment.start, // Atur posisi vertikal
          children: [
            Column(
              // Kolom pertama
              children: [
                Text('Kolom 1 - Baris 1'),
                Text('Kolom 1 - Baris 2'),
                Text('Kolom 1 - Baris 3'),
              ],
            ),
            Column(
              // Kolom kedua
              children: [
                Text('Kolom 2 - Baris 1'),
                Text('Kolom 2 - Baris 2'),
                Text('Kolom 2 - Baris 2'),
              ],
            ),
            Column(
              // Kolom ketiga
              children: [
                Text('Kolom 3 - Baris 1'),
                Text('Kolom 3 - Baris 1'),
                Text('Kolom 3 - Baris 1'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
