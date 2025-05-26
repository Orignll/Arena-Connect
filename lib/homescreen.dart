// Import library dan konfigurasi tema
import 'package:flutter/material.dart';
import 'package:arena_connect/config/theme.dart'; // File berisi style/font/custom button

// Deklarasi widget stateless HomeScreen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // Konstruktor dengan key opsional

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Warna latar belakang utama
      body: Stack( // Stack digunakan untuk menumpuk widget
        children: [
          // Widget untuk gambar latar belakang (background full screen)
          Positioned.fill(
            child: Image.asset(
              'images/background-image.png', // Path gambar latar belakang
              fit: BoxFit.cover, // Menyesuaikan gambar agar menutupi seluruh layar
            ),
          ),

          // Konten utama di atas background
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Atur jarak antar bagian (atas & bawah)
            children: [
              // Bagian atas: logo dan teks selamat datang
              Column(
                children: [
                  // Baris untuk menempatkan logo di pojok kiri atas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Logo ke kiri
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 40), // Jarak dari sisi kiri & atas
                        child: Image.asset(
                          'images/arena-connect1.png', // Path logo
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                  // Teks "Welcome to"
                  Center(
                    child: Text(
                      "Welcome to",
                      style: superFont0, // Menggunakan style dari theme.dart
                    ),
                  ),
                  // Teks "Arena Connect"
                  Center(
                    child: Text(
                      "Arena Connect",
                      style: superFont0,
                    ),
                  )
                ],
              ),

              // Bagian bawah: tombol Masuk & Daftar
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60), // Jarak dari bawah layar
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Baris tombol masuk & daftar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Tombol diberi jarak merata
                        children: [
                          // Tombol Masuk
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login'); // Navigasi ke halaman login
                            },
                            style: masukButton, // Style dari theme.dart
                            child: Text(
                              "M A S U K",
                              style: masukButtonFont, // Font style dari theme.dart
                            ),
                          ),

                          // Tombol Daftar
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register'); // Navigasi ke halaman register
                            },
                            style: daftarButton, // Style dari theme.dart
                            child: Text(
                              "D A F T A R",
                              style: daftarButtonFont, // Font style dari theme.dart
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10), // Spacer vertikal kecil di bawah tombol
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
