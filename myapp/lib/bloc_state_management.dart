import 'package:flutter/material.dart';
import 'package:myapp/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc bloc = ColorBloc();

  void dispose(){
    bloc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_amber);
              },
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.lightBlue,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_light_blue);
              },
            ),
          ],
        ),
        appBar: AppBar(
          title: Text("BLoC tanpa Library"),
        ),
        body: Center(
          child: StreamBuilder(
              stream: bloc.stateStream,
              initialData: Colors.amber,
              builder: (context, snapshot) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 100,
                  height: 100,
                  color: snapshot.data,
                );
              }),
        ),
      ),
    );
  }
}
