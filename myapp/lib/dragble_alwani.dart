import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  Color color1 = Colors.red;
  Color color2 = Colors.amber;
  Color targetColor = Colors.blue;
  bool isAccepted = false;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Latihan Dragable"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Draggable<Color>(
                    data: color1,
                    childWhenDragging: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color:Colors.black26,
                        shape: StadiumBorder(),
                        elevation: 0,
                      ),
                    ),
                    feedback: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color:color1.withOpacity(0.5),
                        shape: const StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color:color1,
                        shape: const StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                  ),
                   Draggable<Color>(
                    data: color2,
                    childWhenDragging: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color:Colors.black26,
                        shape: StadiumBorder(),
                        elevation: 0,
                      ),
                    ),
                    feedback: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color:color2.withOpacity(0.5),
                        shape: const StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color:color2,
                        shape: const StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                  ),
                ],
              ),
              DragTarget<Color>(
                onWillAcceptWithDetails: (value) => true,
                onAcceptWithDetails: (value) {isAccepted = true; targetColor = value;},
                builder: (context, candidates, rejected ){
                  return (isAccepted) ? SizedBox(
                      width: 100,
                      height: 100,
                      child: Material(
                        color:targetColor,
                        shape: const StadiumBorder(),
              
                      ),
                    ) : const SizedBox(
                      width: 100,
                      height: 100,
                      child: Material(
                        color:Colors.black26,
                        shape: StadiumBorder(),
                    
                      ),
                    );
                },
              )
            ],
          )),
    );
  }
}
