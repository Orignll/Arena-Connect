// Import file halaman dan library yang dibutuhkan
import 'package:arena_connect/screens/authentication/register.dart'; // Halaman register
import 'package:arena_connect/screens/authentication/login.dart';    // Halaman login
import 'package:arena_connect/homescreen.dart';                      // Home screen awal
import 'package:arena_connect/screens/history/history.dart';         // Halaman riwayat
import 'package:arena_connect/screens/homepage/home.dart';           // Halaman utama
import 'package:arena_connect/screens/profile/profilepage.dart';     // Halaman profil
import 'package:arena_connect/screens/search/sparring_search.dart';  // Halaman pencarian sparring
import 'package:flutter/material.dart';                              // Library UI Flutter
import 'package:device_preview/device_preview.dart';                 // Plugin untuk pratinjau tampilan berbagai perangkat
import 'package:arena_connect/layouts/bottom_navigation.dart';       // Komponen navigasi bawah

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Aktifkan DevicePreview
      tools: const [
        ...DevicePreview.defaultTools, // Gunakan alat default dari DevicePreview
      ],
      builder: (context) => const MainApp(), // Bangun aplikasi utama
    ),
  );
}

// Widget utama aplikasi
class MainApp extends StatelessWidget {
  const MainApp({super.key}); // Konstruktor default dengan key opsional

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hilangkan banner DEBUG
      theme: ThemeData(primaryColor: Colors.white), // Tema aplikasi (warna utama putih)
      initialRoute: '/', // Rute awal saat aplikasi dibuka
      routes: {
        '/': (context) => const HomeScreen(), // Rute awal ke HomeScreen
        '/login': (context) => const LoginPage(), // Halaman login
        '/register': (context) => const RegisterPage(), // Halaman registrasi
        '/homepage': (context) => const BottomNavWrapper(child: Home()), // Halaman utama dibungkus navigasi bawah
        '/profile': (context) => const BottomNavWrapper(child: ProfilePage()), // Halaman profil dengan navigasi bawah
        '/search': (context) => const BottomNavWrapper(child: SparringSearch()), // Halaman pencarian dengan navigasi bawah
        '/history': (context) => BottomNavWrapper(child: HistoryScreen()), // Halaman riwayat dengan navigasi bawah
      },
    );
  }
}

// Widget pembungkus untuk menambahkan BottomNavigation ke halaman
class BottomNavWrapper extends StatelessWidget {
  final Widget child; // Widget yang akan ditampilkan di atas bottom navigation

  const BottomNavWrapper({required this.child, super.key}); // Konstruktor menerima widget anak

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child, // Tampilkan halaman utama
      bottomNavigationBar: const BottomNavigation(), // Tambahkan navigasi bawah tetap
    );
  }
}
