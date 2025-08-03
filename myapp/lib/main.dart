import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myapp/post_result_model.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("API Demo"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text((postResult != null ? postResult.id + "|" +
              postResult.name + "|" +
              postResult.job + "|" +
              postResult.created : 'Tidak ada data ')),
              ElevatedButton(onPressed: () {
                PostResult.connectToAPI("Badu", "Dokter").then((value){
                  postResult = value;
                  setState(() {
                    
                  });
                });
              }, child: Text("POST"),
              
              ),
            ],
          ),
        ),
      ),
    );
  }
}