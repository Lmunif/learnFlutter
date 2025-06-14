import 'package:flutter/material.dart';
import 'dart:math';

class ColorfulButton extends StatefulWidget {
  // const ColorfulButton({super.key});

  Color mainCOlor, secondColor;
  IconData iconData;

  @override
  State<ColorfulButton> createState() =>
      _ColorfulButtonState(mainCOlor, secondColor, iconData);

  ColorfulButton(this.mainCOlor, this.secondColor, this.iconData);
}

class _ColorfulButtonState extends State<ColorfulButton> {
  bool isPressed = false;
  Color mainCOlor, secondColor;
  IconData iconData;


  _ColorfulButtonState(this.mainCOlor, this.secondColor, this.iconData);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 4,
      child: GestureDetector(
        onTapDown: (details){
          setState(() {
            isPressed = !isPressed;
          });
        },
        onTapUp: (details){
          setState(() {
            isPressed = !isPressed;
          });
        },
        onTapCancel: (){
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: Material(
          borderRadius: BorderRadius.circular(15),
          shadowColor:  (isPressed) ? secondColor : mainCOlor,
          elevation:  (isPressed) ? 5 : 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                SizedBox(
                    width: 50,
                    height: 50,
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      color: (isPressed) ? secondColor : mainCOlor,
                      child: Transform.rotate(
                        angle: - pi / 4,
                        child: Icon(
                          iconData,
                          color: Colors.white,
                        ),
                      ),
                    )),
                    Transform.translate(
                      offset: Offset(30, 30),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Material(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(-30, -30),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Material(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(30, -30),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Material(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(-30, 30),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Material(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
