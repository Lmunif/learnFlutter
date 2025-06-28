import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer audioPlayer = AudioPlayer();
  String durasi = "00:00:00"; 

  @override
  void initState() {
    super.initState();

    audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        durasi = p.toString().split('.').first; 
      });
    });
  }

  
  Future<void> playSound(String url) async {

    await audioPlayer.play(UrlSource(url));
  }

  // Fungsi untuk menjeda suara
  Future<void> pauseSound() async {
    await audioPlayer.pause();
  }

  // Fungsi untuk menghentikan suara
  Future<void> stopSound() async {
    await audioPlayer.stop();
  }

  // Fungsi untuk melanjutkan suara
  Future<void> resumeSound() async {
    await audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Playing Music"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  playSound("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3");
                },
                child: Text("Play"),
              ),
              ElevatedButton(
                onPressed: () {
                  pauseSound();
                },
                child: Text("Pause"),
              ),
              ElevatedButton(
                onPressed: () {
                  stopSound();
                },
                child: Text("Stop"),
              ),
              ElevatedButton(
                onPressed: () {
                  resumeSound();
                },
                child: Text("Resume"),
              ),
              Text(
                "Durasi: $durasi",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Contoh untuk mencari waktu tertentu (misal 30 detik)
              ElevatedButton(
                onPressed: () {
                  audioPlayer.seek(Duration(seconds: 30));
                },
                child: Text("Mulai dari 30 detik"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.release(); // Melepaskan sumber daya audio saat widget dibuang
    super.dispose();
  }
}