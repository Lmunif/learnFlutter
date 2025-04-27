import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   bool isObscured = true; // Untuk menyembunyikan/memperlihatkan password



  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Latihan Text Field"),),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.lightBlue[50],
                  filled: true,
                  // icon: Icon(Icons.adb),
                  suffix: Container(width: 15, height: 15, color: Colors.red,),
                  prefixIcon: const Icon(Icons.person),
                  prefixText: "Name: ",
                  labelText: "Nama Lengkap",
                  hintText: "Nama Lengkapnya loh..",
                  hintStyle: const TextStyle(fontSize: 20),
                  prefixStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
                maxLength: 5,
              ),
              TextField(
                obscureText: isObscured,
                decoration: InputDecoration(
                fillColor: Colors.lightBlue[50],
                filled: true,
                prefixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscured = !isObscured; // Toggle visibility
                      });
                    },
                    child: Icon(
                      isObscured ? Icons.visibility : Icons.visibility_off,
                      // color: Colors.blue,
                    ),
                  ),
                //   suffixIcon: IconButton( // Ikon bisa diklik
                //   icon: Icon(Icons.remove_red_eye),
                //   onPressed: () {
                //     print("Ikon diklik!");
                //   },
                // ),
                  // icon: Icon(Icons.adb),
                  // suffix: Container(width: 15, height: 15, color: Colors.red,),
                  // prefixIcon: Icon(Icons.remove_red_eye),
                  prefixText: "Password: ",
                  labelText: "Password",
                  hintText: "Password harus 5 karakter",
                  hintStyle: const TextStyle(fontSize: 20),
                  prefixStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
                maxLength: 5,
              ),
              ElevatedButton(onPressed: (){}, child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
