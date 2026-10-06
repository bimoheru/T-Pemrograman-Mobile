import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perkenalan Diri',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perkenalan Diri'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/avatar.png'),
              ),

              const SizedBox(height: 20),

              const Text(
                'M Bimo Heru W',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Teknik Informatika',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              const Text(
                'Universitas Suryakancana',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Saya adalah mahasiswa Teknik Informatika '
                'yang suka dalam dunia tech',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Hobi: Apapun itu selagi tidak menggigit. Main game? oh tentu',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}