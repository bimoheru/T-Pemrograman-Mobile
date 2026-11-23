import 'package:flutter/material.dart';
import 'package:tugas_6/homePage.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, String>> travelData = [
  {
    'nama'   : 'Raja Ampat',
    'gambar' : 'https://images.unsplash.com/photo-1703769605297-cc74106244d9?q=80&w=1184&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    'lokasi' : 'Papua',
  },
  {
    'nama'   : 'Candi Borobudur',
    'gambar' : 'https://images.unsplash.com/photo-1780748921231-a11ec035ee6d?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    'lokasi' : 'Jawa Tengah',
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Katalog Wisata',
      home: HomePage(travelData: travelData),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 148, 150, 150),
          foregroundColor: Colors.white,
          centerTitle: true,
        )
      ),
    );
  }
}