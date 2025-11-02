import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Widget Flutter 1.9 (Fixed)',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const WidgetDemoScreen(),
    );
  }
}

class WidgetDemoScreen extends StatefulWidget {
  const WidgetDemoScreen({Key? key}) : super(key: key);

  @override
  State<WidgetDemoScreen> createState() => _WidgetDemoScreenState();
}

class _WidgetDemoScreenState extends State<WidgetDemoScreen> {
  // State untuk ToggleButtons: [True, False, False] berarti tombol pertama yang terpilih
  List<bool> _isSelected = [true, false, false];

  // Daftar ColorFilter yang akan digunakan oleh ToggleButtons
  final List<ColorFilter> _filters = [
    // ✅ Menggunakan BlendMode.color untuk perubahan warna solid
    const ColorFilter.mode(Colors.teal, BlendMode.color),
    const ColorFilter.mode(Colors.red, BlendMode.color),
    const ColorFilter.mode(Colors.purple, BlendMode.color),
  ];

  // State ColorFilter awal, disesuaikan dengan BlendMode.color
  late ColorFilter _colorFilter = _filters[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 1.9 Widgets Demo (Fixed)'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 1. SelectableText Widget
            const Text(
              '1. SelectableText (Bisa disalin):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const SelectableText(
                'Teks ini bisa dipilih dan disalin. Fitur ini sangat berguna untuk menampilkan informasi penting.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ),

            const Divider(height: 40, thickness: 1),

            // 2. ToggleButtons Widget
            const Text(
              '2. ToggleButtons (Mengubah Warna Icon):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Center(
              child: ToggleButtons(
                isSelected: _isSelected,
                onPressed: (int index) {
                  setState(() {
                    // Logika single selection
                    for (int i = 0; i < _isSelected.length; i++) {
                      _isSelected[i] = i == index;
                    }
                    // Mengubah ColorFilter berdasarkan tombol yang diklik
                    _colorFilter = _filters[index];
                  });
                },
                
                // Kustomisasi Tampilan Tombol
                borderRadius: BorderRadius.circular(10.0),
                selectedColor: Colors.white,           
                fillColor: Colors.teal.shade700,       
                color: Colors.teal,                    
                borderColor: Colors.teal.shade300,
                selectedBorderColor: Colors.teal.shade900,

                children: const <Widget>[
                  Padding(padding: EdgeInsets.symmetric(horizontal: 12.0), child: Text('Teal')),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 12.0), child: Text('Merah')),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 12.0), child: Text('Ungu')),
                ],
              ),
            ),

            const Divider(height: 40, thickness: 1),

            // 3. ColorFiltered Widget
            const Text(
              '3. ColorFiltered (Icon di bawah):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Center(
              child: ColorFiltered(
                colorFilter: _colorFilter, 
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.star,
                      size: 100,
                      // Penting: Icon harus punya warna (putih) agar filter warna bekerja optimal
                      color: Colors.white, 
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Icon bintang ini akan berubah warna secara solid.',
                style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}