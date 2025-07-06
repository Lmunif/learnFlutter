import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String text = "Hasil QR Scan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Scan QR"),
              onPressed: () async {
                // Memanggil fungsi scan dan menangani hasilnya
                String? scannedText = await scanner.scan();
                if (scannedText != null) {
                  setState(() {
                    text = scannedText; // Update text dengan hasil scan
                  });
                } else {
                  // Menangani kasus jika pemindaian dibatalkan
                  setState(() {
                    text = "Pemindaian dibatalkan"; 
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}