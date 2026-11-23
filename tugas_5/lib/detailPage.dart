import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  final String nama;
  final String harga;
  final String deskripsi;
  final String gambar;

  const DetailPage({
    super.key,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.gambar,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          nama
        ),
        backgroundColor: const Color.fromARGB(255, 16, 184, 44),
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 165, 221, 128)
          ),
          child: Column(
            mainAxisSize: .min,
            children: [
              ClipRRect(
                child: Image.network(gambar),
              ),
              Text(nama,
              style: TextStyle(fontWeight: .bold, fontSize: 25)
              ),
              Text(harga),
              Divider(color: Colors.white,),
              Text(deskripsi, textAlign: .center,)
            ],
          ),

        ),
      ),

    );
  }
}