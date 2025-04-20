import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int likeVar = 0;
  DateTime dateTime = DateTime.now();

  List<String> dateTimes = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "Mei",
    "Jun",
    "Jul",
    "Agus",
    "Sept",
    "Oct",
    "Nov",
    "Des"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Custom Card Example",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF8C062F),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFFFE5788), Color(0xFFF56D5D)])),
            ),
            Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Card(
                    elevation: 10,
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.7,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://st.depositphotos.com/1081688/3132/i/450/depositphotos_31325893-stock-photo-white-paper-texture.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2013/10/09/02/26/lake-192979_1280.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              20,
                              50 + (MediaQuery.of(context).size.height * 0.35),
                              20,
                              20),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "Beautiful Sunset At Paddy Field",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFF56D5D), fontSize: 25),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Posted on ",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      Text(
                                        dateTimes[dateTime.month] +
                                            " " +
                                            dateTime.day.toString() +
                                            ", " +
                                            dateTime.year.toString() +
                                            " " +
                                            dateTime.hour.toString() +
                                            ":" +
                                            dateTime.minute.toString() +
                                            ":" +
                                            dateTime.second.toString(),
                                        style: TextStyle(
                                            color: Color(0xFFF56D5D),
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Spacer(
                                      flex: 15,
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.thumb_up,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                      tooltip: 'Like',
                                      onPressed: () {
                                        setState(() {
                                          DateTime dateTimes = DateTime.now();
                                          likeVar++;
                                          dateTime = dateTimes;
                                        });
                                      },
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      likeVar.toString(),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.thumb_down,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                      tooltip: 'Dislike',
                                      onPressed: () {
                                        setState(() {
                                          likeVar++;
                                        });
                                      },
                                    ),
                                    Spacer(
                                      flex: 3,
                                    ),
                                    Icon(
                                      Icons.comment,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "888",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Spacer(
                                      flex: 15,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
