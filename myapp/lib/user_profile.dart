// user_profile.dart (Modifikasi)

import 'package:flutter/material.dart';

// ... (Bagian class UserProfilePage tetap sama)

class UserProfilePage extends StatelessWidget {
  // ... (Properti userName dan email tetap sama)

  /// TEST
  final String userName;
  final String email;

  const UserProfilePage({
    super.key,
    required this.userName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doc Comment Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ----------------------------------------------------
            // BAGIAN PENAMBAHAN GAMBAR (FOTO PROFIL)
            // ----------------------------------------------------
            /// [CircleAvatar] digunakan untuk menampilkan foto profil.
            /// Jika menggunakan gambar lokal, pastikan sudah ada di folder 'assets/' 
            /// dan dideklarasikan di file pubspec.yaml.
            const CircleAvatar(
              radius: 50, // Ukuran radius lingkaran
              backgroundImage: AssetImage('images/kucing.jpg'), 
              // Atau Image.network('URL_GAMBAR_ONLINE_ANDA')
            ),
            const SizedBox(height: 20),
            // ----------------------------------------------------

            Text(
              showTitle(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Nama: $userName',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
  
  // ... (Metode showTitle() tetap sama)
  String showTitle() {
    return 'Profil dari $userName';
  }
}