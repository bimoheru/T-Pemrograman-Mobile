import 'package:flutter/material.dart';

class BMIscreen extends StatefulWidget {
  const new({super.key});

  @override
  State<BMIscreen> createState() => _BMIscreenState();
}

class _BMIscreenState extends State<BMIscreen> {
  final _bbController = TextEditingController();
  final _tbController = TextEditingController();

  String _jenisKelamin = 'Laki-laki';
  double? _hasilBMI;
  String _keterangan = "Silahkan Masukkan Data Anda: ";

  void _hitungBMI() {
    final double bb = double.tryParse(_bbController.text) ?? 0;
    final double tbCm = double.tryParse(_tbController.text) ?? 0;

    setState(() {
      if (bb > 0 && tbCm > 0) {
        final double tbM = tbCm / 100;
        final double hasil = bb / (tbM * tbM);

        _hasilBMI = hasil;
        if (_jenisKelamin == 'Laki-laki') {
          if (hasil < 18.5) {
            _keterangan = "U Kuruss";
          } else if (hasil < 25) {
            _keterangan = "Ideal";
          } else if (hasil < 30) {
            _keterangan = "U gendut";
          } else {
            _keterangan = "Obess";
          }
        } else {
          // Kategori BMI untuk Perempuan
          if (hasil < 18.0) {
            _keterangan = "U Kuruss";
          } else if (hasil < 24) {
            _keterangan = "Ideal";
          } else if (hasil < 29) {
            _keterangan = "U gendut";
          } else {
            _keterangan = "Obess";
          }
        }
      } else {
        _hasilBMI = null;
        _keterangan = "Data tidak VALIDD";
      }
    });
  }

  void _reset() {
    setState(() {
      _bbController.clear();
      _tbController.clear();
      _jenisKelamin = 'Laki-laki';
      _hasilBMI = null;
      _keterangan = "Silahkan Masukkan Data Anda: ";
    });
  }

  @override
  void dispose() {
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kalkulator BMI',
          style: TextStyle(
            fontWeight: .bold,
            color: Colors.white,
            letterSpacing: 5,
          ),
        ),

        centerTitle: true,
        leading: Icon(Icons.accessibility_rounded, color: Colors.white),
        backgroundColor: Colors.blueGrey,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SegmentedButton<String>(
                showSelectedIcon: false,
                segments: const [
                  ButtonSegment<String>(
                    value: 'Laki-laki',
                    label: Text('Laki-laki'),
                    icon: Icon(Icons.male, color: Colors.blue),
                  ),
                  ButtonSegment<String>(
                    value: 'Perempuan',
                    label: Text('Perempuan'),
                    icon: Icon(Icons.female, color: Colors.pink),
                  ),
                ],
                selected: {_jenisKelamin},
                onSelectionChanged: (Set<String> newSelection) {
                  setState(() {
                    _jenisKelamin = newSelection.first;
                  });
                },
              ),

              SizedBox(height: 20),
              TextField(
                controller: _bbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  icon: Icon(Icons.line_weight_outlined),
                  labelText: 'Berat Badan',
                ),
              ),

              SizedBox(height: 20),
              TextField(
                controller: _tbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  icon: Icon(Icons.height_outlined),
                  labelText: 'Tinggi Badan',
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _hitungBMI(),
                    child: Icon(Icons.calculate, size: 30),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => _reset(),
                    child: Icon(Icons.restart_alt, size: 30),
                  ),
                ],
              ),

              SizedBox(height: 15),
              Text('Hasil: '),

              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey,
                ),

                child: Column(
                  children: [
                    Text(
                      _hasilBMI?.toStringAsFixed(1) ?? "--",
                      style: TextStyle(fontSize: 50, fontWeight: .bold),
                    ),

                    Text(
                      _keterangan,
                      style: TextStyle(fontSize: 30, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
