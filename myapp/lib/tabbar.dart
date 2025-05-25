import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Contoh Tab bar"),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.comment),
                  text: "Comments",
                ),
                Tab(
                  child: Image(
                    image: AssetImage("assets/pictures/fb1.png"),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.computer),
                ),
                Tab(
                  text: "News",
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            Center(
              child: Text("Tab 1"),
            ),
            Center(
              child: Text("Tab 2"),
            ),
            Center(
              child: Text("Tab 3"),
            ),
            Center(
              child: Text("Tab 4"),
            )
          ]),
        ),
      ),
    );
  }
}
