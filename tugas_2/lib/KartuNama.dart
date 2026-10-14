import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KartuNama extends StatelessWidget {
  const KartuNama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/img/sepongbob stiker.jpg') ,
                radius: 90,
              ),
              Text('Gacor Kang',
                style: GoogleFonts.aldrich(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: .bold
                ),
              ),
              Text('Gacor Kang',
                style: GoogleFonts.aldrich(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),

              SizedBox(
                height: 50,
                width: 300,
                child: Divider(
                  color: Colors.white,
                ),
              ),

              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                child: ListTile(
                  leading: Icon(Icons.call),
                  title: Text('+62 857696969'),
                ),
              ),
              
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ListTile(
                  leading: Icon(Icons.mail),
                  title: Text('sepongbob69@gmail.com',
                    style: GoogleFonts.aDLaMDisplay(),
                  ),
                ),
              ),

              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20
                  ),
                child: const ListTile(
                  leading: Icon(Icons.camera_alt,
                    color: Colors.pink,
                  ),
                  title: Text('Instagram',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('@b.imzz'),
                )
              ),

              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 20
                  ),
                child: const ListTile(
                  leading: Icon(Icons.games,
                    color: Colors.pink,
                  ),
                  title: Text('Discord',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('bim_26'),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}