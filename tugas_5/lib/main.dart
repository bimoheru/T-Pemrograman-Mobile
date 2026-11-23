import 'package:flutter/material.dart';
import 'package:tugas_5/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}