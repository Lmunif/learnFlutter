import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Kolom Kesamping"),
        ),
        body: const Row(
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
