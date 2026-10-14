import 'package:flutter/material.dart';
import 'package:pertemuan2/KartuNama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Name Card',
      debugShowCheckedModeBanner: false,
      home: KartuNama(),
    );
  }
}