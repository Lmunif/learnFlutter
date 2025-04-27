import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool bolean   = true;
  String tulisan   = 'Munculkan Pertama';


  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Latihan Text Field"),),
        body: Container(
          margin: const EdgeInsets.all(20),
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
                  // bolean = false;
                  // tulisan = "sembunyikan";
                  if (bolean == true ){
                    tulisan = "sembunyikan";
                    bolean = false;
                  }
                  else {
                    tulisan = "munculkan";
                    bolean = true;
                  }
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
