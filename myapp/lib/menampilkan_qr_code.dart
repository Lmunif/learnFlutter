import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart'; // Pastikan ini sudah diinstall di pubspec.yaml

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImageView(
                  version: 6,
                  backgroundColor: Colors.grey.shade200, // ← ini diperbaiki
                  foregroundColor: Colors.pink,
                  errorCorrectionLevel: QrErrorCorrectLevel.H,
                  padding: const EdgeInsets.all(30),
                  size: 200,
                  data: 'Kode barang' + 'no rekening' + '2000',
                ),
                const SizedBox(height: 40),
                BarcodeWidget(
                  barcode: Barcode.code128(), // Tipe barcode
                  data: 'https://www.w3schools.com/',
                  width: 300,
                  height: 120,
                  drawText: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
