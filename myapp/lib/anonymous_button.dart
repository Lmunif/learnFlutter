import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String message = "Ini adalah Text"; 
  String tekan   = "Tekan Saya";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Anonymous Method"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message,
              style: TextStyle(
              color: message == "Tombol sudah ditekan" ? Colors.blue : Colors.red),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if(message == 'Tombol sudah ditekan'){
                        message = 'Ini adalah Text';
                        tekan = 'Tekan Saya';

                      }else{
                        message = "Tombol sudah ditekan";
                        tekan = 'Reset';
                      }
                    });
                  },
                  child: Text(tekan))
            ],
          ),
        ),
      ),
    );
  }
}
