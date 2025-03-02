import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:myapp/login_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}