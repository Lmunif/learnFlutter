import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom Progress Bar"),
        ),
        body: Center(
          child: ChangeNotifierProvider<TimeState>(
            create: (context) => TimeState(),
            child: const TimerScreen(),
          ),
        ),
      ),
    );
  }
}

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Timer? _timer;
  final TextEditingController _controller = TextEditingController(text: '15');
  int _totalValue = 15;

  void _startTimer(TimeState timeState) {
    if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeState.time == 0) {
        timer.cancel();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Waktu anda telah habis"),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        timeState.time -= 1;
      }
    });
  }

  void _setTotalValue(TimeState timeState) {
    final input = int.tryParse(_controller.text);
    if (input != null && input > 0) {
      setState(() {
        _totalValue = input;
      });
      timeState.time = input; // Reset waktu ke input baru
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Masukkan angka valid lebih dari 0"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeState>(
      builder: (context, timeState, _) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomProgressBar(
            width: 200,
            value: timeState.time,
            totalValue: _totalValue,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 150,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Total Waktu (detik)',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
            ),
            onPressed: () {
              _setTotalValue(timeState);
            },
            child: const Text(
              "Set Total Waktu",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
            ),
            onPressed: () => _startTimer(timeState),
            child: const Text(
              "Start",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  final double width;
  final int value;
  final int totalValue;

  const CustomProgressBar({
    Key? key,
    required this.width,
    required this.value,
    required this.totalValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.timer,
          color: Colors.grey[700],
        ),
        const SizedBox(width: 5),
        Stack(
          children: [
            Container(
              width: width,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(5),
              elevation: 3,
              child: AnimatedContainer(
                height: 10,
                width: width * ratio,
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: (ratio < 0.3)
                      ? Colors.red
                      : (ratio < 0.6)
                          ? Colors.amber[400]
                          : Colors.lightGreen,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TimeState with ChangeNotifier {
  int _time = 15;

  int get time => _time;

  set time(int newTime) {
    if (newTime < 0) {
      _time = 0;
    } else {
      _time = newTime;
    }
    notifyListeners();
  }
}
