import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgets = [];
  int counter = 1;
  double ukuran = 10;

  // _MyAppState() {
  //   for (int i = 0; i < 15; i++){
  //     widgets.add(Text("Data ke-" + i.toString(), style: TextStyle(fontSize: 35),));
  //   }

  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Listview"),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widgets.add(Text(
                          "Data ke-$counter",
                          style: TextStyle(
                              fontSize: counter == 8
                                  ? ukuran = ukuran + 100
                                  : ukuran++),
                        ));
                        counter++;
                      });
                    },
                    child: const Text("Tambah Data")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widgets.removeLast();
                        counter--;
                        if (counter == 8) {
                          ukuran = ukuran - 100;
                        } else {
                          ukuran--;
                        }
                      });
                    },
                    child: const Text("Hapus Data")),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgets,
            )
          ],
        ),
      ),
    );
  }
}
