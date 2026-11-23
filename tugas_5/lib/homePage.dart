import 'package:flutter/material.dart';
import 'package:tugas_5/detailPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> products = [
      {
        'nama' : 'Asus Rog Zepirusss G14',
        'harga' : 'Rp 50.000.000',
        'deskripsi' : 'Laptop mantap nikmat untuk cool yeah',
        'gambar' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ83iJCpnx1v1Xjr-EVJcyOKFw0sFdyy1W3aKrTghAvvycicTn6qh5dUTna&s=10'
      },
      {
        'nama' : 'Asus Rog Zepirusss G16',
        'harga' : 'Rp 50.000.000',
        'deskripsi' : 'Laptop mantap nikmat untuk cool yeah',
        'gambar' : 'https://i0.wp.com/www.amd-id.com/wp-content/uploads/2024/08/Picture2222.jpg?resize=696%2C408&ssl=1g'
      },
      {
        'nama' : 'Acer Predator Helioss Neo 16',
        'harga' : 'Rp 24.000.000',
        'deskripsi' : 'Laptop mantap nikmat untuk cool yeah',
        'gambar' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLP5pkolvRzP6ieySmvbzB1vyu7nw_UoJzC7b3uAiwcR0iquz7e3Cvmpgq&s=10'
      },
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.store_mall_directory),
        title: Text(
          'Produk Terbaru'
        ),
        backgroundColor: const Color.fromARGB(255, 16, 184, 44),
        foregroundColor: Colors.white
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.network(
                    product['gambar']!,
                    width: 60,
                    height: 65,
                    fit: BoxFit.cover,

                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        child: Icon(Icons.store_mall_directory),
                      );
                    }
                  ),
                ),

                title: Text(
                  product['nama']!,
                  style: TextStyle(fontWeight: .bold),
                ),

                subtitle: Text(
                  product['deskripsi']!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                trailing: Icon(Icons.chevron_right, fontWeight: .bold),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        nama: product['nama']!, 
                        harga: product['harga']!, 
                        deskripsi: product ['deskripsi']!, 
                        gambar: product ['gambar']!
                      ),
                    
                    )
                  );
                } ,
              ),
            );
          },
        ) ,
      ),
    );
  }
}