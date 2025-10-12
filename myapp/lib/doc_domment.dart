// main.dart

import 'package:flutter/material.dart';
import 'user_profile.dart'; 

/// Titik masuk (entry point) utama untuk menjalankan aplikasi Flutter.
void main() {
  // Fungsi runApp menerima Widget dan menjadikannya root dari tree widget.
  runApp(const MyApp());
}

// --------------------------------------------------------------------------------

/// Widget root (akar) aplikasi.
/// 
/// Ini adalah [StatelessWidget] yang mendefinisikan tampilan dasar
/// seperti tema (`ThemeData`) dan halaman awal (`home`).
class MyApp extends StatelessWidget {
  /// Konstruktor untuk MyApp.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doc Comment Demo',
      // Mendefinisikan tema visual aplikasi.
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Memuat UserProfilePage sebagai halaman awal aplikasi.
      home: const UserProfilePage(
        userName: 'Erico Darmawan',
        email: 'erico.darmawan@contoh.com',
        // Jika Anda menambahkan properti gambar di user_profile.dart:
        // profileAsset: 'assets/images/profile.png', 
      ), 
    );
  }
}