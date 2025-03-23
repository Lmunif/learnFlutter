import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool bolean   = true;
  String tulisan   = 'Munculkan';


  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Latihan Text Field"),),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  obscureText: bolean,
                  onChanged: (value){
                    setState(() {
                      
                    });
                  },
                  controller: controller,
                ),
                ElevatedButton(onPressed:(){
                  bolean = false;
                  tulisan = "sembunyikan";

                  setState(() {
                      
                    });
                }, child: Text(tulisan)),
                Text(controller.text)
              ],
          ),
        ),
      ),
    );
  }
}
