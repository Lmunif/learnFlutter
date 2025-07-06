import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'qr_scan_page.dart'; // jika QRScanPage dipisah di file lain

void main() {
  runApp(MyApp());
}

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
  String result = 'Hasil QR Code akan muncul di sini';

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
              result,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Scan QR Code"),
              onPressed: () async {
                final hasil = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRScanPage()),
                );
                if (hasil != null) {
                  setState(() {
                    result = hasil;
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
