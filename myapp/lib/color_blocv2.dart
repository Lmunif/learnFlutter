import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

// Event-nya sudah benar
enum ColorEvent { to_amber, to_light_blue }

// Mengganti Bloc menjadi Cubit jika hanya ada 1 state dan tidak ada logic kompleks,
// namun karena Anda menggunakan Event, kita tetap pakai Bloc dan menggunakan
// konstruktor 'on<Event>' yang modern.

class ColorBlocv2 extends Bloc<ColorEvent, Color> {

  // Konstruktor modern: Inisialisasi state awal di 'super'
  ColorBlocv2() : super(Colors.amber) {
    
    // Mendaftarkan handler untuk event 'to_amber'
    on<ColorEvent>((event, emit) {
      if (event == ColorEvent.to_amber) {
        // Menggunakan emit() untuk mengirim state baru
        emit(Colors.amber);
      } else if (event == ColorEvent.to_light_blue) {
        // Menggunakan emit() untuk mengirim state baru
        emit(Colors.lightBlue);
      }
    });

    // ATAU lebih spesifik (opsional, jika Anda ingin memisahkan event):
    /*
    on<ColorEvent>((event, emit) async {
      if (event == ColorEvent.to_amber) {
        emit(Colors.amber);
      } else if (event == ColorEvent.to_light_blue) {
        emit(Colors.lightBlue);
      }
    });
    */
  }

  // Hapus mapEventToState karena sudah usang pada versi modern
  /*
  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    if (event == ColorEvent.to_amber) {
      yield Colors.amber;
    } else if (event == ColorEvent.to_light_blue) {
      yield Colors.lightBlue;
    }
  }
  */
}