import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Membuat Button"),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2), // Border untuk Row
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Column Kiri
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2), // Border untuk Column kiri
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.amber),
                        ),
                        child: const Text("Elevated Button"),
                      ),
                      const SizedBox(height: 20),
                      Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 2,
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [Colors.purple, Colors.pink],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.amber,
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                print("Tes");
                              },
                              child: const Center(
                                child: Text(
                                  "My Button",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20), 
                
                // Column Kanan
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2), // Border untuk Column kanan
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.lightBlueAccent),
                        ),
                        child: const Text("Elevated Button"),
                      ),
                      const SizedBox(height: 20),
                       Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 2,
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [Colors.purple, Colors.pink],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.amber,
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                print("Tes");
                              },
                              child: const Center(
                                child: Text(
                                  "My Button2",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
