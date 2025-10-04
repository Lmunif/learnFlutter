import 'package:flutter/material.dart';
// Hapus import yang tidak digunakan jika ColorBloc tidak ada:
// import 'package:myapp/color_bloc.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart'; // Import ini dibutuhkan untuk BlocProvider, BlocBuilder, dll.
import 'package:myapp/color_blocv2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1. Menggunakan BlocProvider.value atau BlocProvider.builder
      // Pastikan tipe Bloc yang disediakan (ColorBlocv2) sesuai dengan yang dikembalikan di create:
      home: BlocProvider<ColorBlocv2>(
        // Menggunakan create untuk inisialisasi Bloc
        // Pastikan ColorBlocv2() yang dikembalikan
        create: (context) => ColorBlocv2(), 
        child: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Akses Bloc menggunakan context.read<ColorBlocv2>() untuk memanggil fungsi (dispatch)
    // Atau menggunakan context.watch<ColorBlocv2>() untuk mendengarkan perubahan, tapi 
    // di sini kita hanya perlu memanggil event, jadi context.read lebih efisien.
    // Jika Anda ingin mempertahankan sintaks lama, BlocProvider.of<ColorBlocv2>(context) sudah benar,
    // namun seringkali disarankan untuk menggunakan ekstensi context.
    
    // Perhatikan: Dalam implementasi bloc/flutter_bloc modern, dispatch() telah diganti dengan add().
    // Kita akan menggunakan 'add' dan memperbaiki color_blocv2.dart.
    final ColorBlocv2 bloc = context.read<ColorBlocv2>(); 

    int tanda = 0;

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.amber, 
            onPressed: () {
              // Ganti .dispatch dengan .add sesuai praktik BLoC modern
              bloc.add(ColorEvent.to_amber);
              tanda = 0;
            },
            child: const Icon(Icons.wb_sunny, color: Colors.white),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.lightBlue, 
            onPressed: () {
              // Ganti .dispatch dengan .add sesuai praktik BLoC modern
              bloc.add(ColorEvent.to_light_blue);
              tanda = 1;
            },
            child: const Icon(Icons.cloud, color: Colors.white,)
          ),
        ],
      ),
      appBar: AppBar(title: const Text("BLoC dengan flutter_bloc")),
      body: Center(
        // 3. Menggunakan BlocBuilder
        child: BlocBuilder<ColorBlocv2, Color>(
          // Perbaiki penulisan: 'builder' harus huruf kecil
          builder: (context, currentColor) => AnimatedContainer(
            width: 100,
            height: 100,
            color: currentColor,
            duration: const Duration(milliseconds: 500),
            child: tanda == 0 ? Icon(Icons.wb_sunny, color: Colors.white, size: 50,) : Icon(Icons.cloud, color: Colors.white, size: 50,)
          ),
        ),
      ),
    );
  }
}