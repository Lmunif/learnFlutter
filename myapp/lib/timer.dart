import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isStop = true;
  bool isBlack = true;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Timer Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                counter.toString(),
                style: TextStyle(
                    color: isBlack == true && isStop == true ? Colors.black : (counter % 2 == 0 && isStop == false)
                            ? Colors.blue
                            : Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Timer(Duration(seconds: 5), () {
                      setState(() {
                        isBlack = !isBlack;
                      });
                    });
                  },
                  child: Text("Ubah Warna 5 Detik Kemudian")),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Timer.run(() {
                      setState(() {
                        isBlack = !isBlack;
                      });
                    });
                  },
                  child: Text("Ubah Warna Secara Langsung")),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    counter = 0;
                    isStop = false;
                    Timer.periodic(Duration(seconds: 1), (Timer) {
                      if (isStop == true) Timer.cancel();

                      setState(() {
                        counter++;
                      });
                    });
                  },
                  child: Text("Start Timer")),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isStop = true;
                    });
                  },
                  child: Text("Stop Timer")),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (isStop == true) {
                        counter = 0;
                      }
                    });
                  },
                  child: Text("Reset")),
            ],
          ),
        ),
      ),
    );
  }
}
