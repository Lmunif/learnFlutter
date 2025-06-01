import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TabBar myTabBar = TabBar(
      indicator: BoxDecoration(
        color: Colors.red,
        border: Border.all(color: Colors.green, width: 2),
      ),
      tabs: [
        Container(
          width: 1000,
          child: Tab(
            icon: Icon(
              Icons.comment,
            ),
            text: "Comments",
          ),
        ),
        Container(
          width: 600,
          child: Tab(
            icon: Icon(Icons.computer),
            text: "Computers",
          ),
        )
      ],
    );
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: Text("Contoh Tab bar"),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
                  child: Container(
                    color: Colors.amber,
                    child: myTabBar,
                  ))),
          body: TabBarView(children: [
            Center(
              child: Text("Tab 1"),
            ),
            Center(
              child: Text("Tab 2"),
            ),
          ]),
        ),
      ),
    );
  }
}
