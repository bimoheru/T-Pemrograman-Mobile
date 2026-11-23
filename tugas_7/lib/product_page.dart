import 'package:flutter/material.dart';
import 'package:tugas_7/cart_model.dart';
import 'package:tugas_7/cart_page.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final products = [
    Product('Minyak Goreng', 'Minyak goreng dari sawit aseli'),
    Product('Terigu', 'Terigu aseli no fek'),
    Product('Telor', 'dari telor ayam bukan ...')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Sembako KOPDES Merah Putih'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,

        actions: [
          Padding (
            padding: EdgeInsetsGeometry.only(right: 14),
            child: Consumer<CartModel> (
              builder: (context, cart, child) {
                return Badge (
                  label: Text('${cart.totalItems}'),
                  isLabelVisible: cart.totalItems > 0,

                  child: IconButton (
                    onPressed: (){
                      Navigator.push (
                        context,
                        MaterialPageRoute (
                          builder: (context) => CartPage(),
                        )
                      );
                    }, 
                    icon: Icon(Icons.shopping_cart)
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: ListView.builder (
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Card(
            margin: EdgeInsets.all(5),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.shopping_bag),
              ),
              title: Text(item.nama),
              subtitle: Text(item.deskripsi),
              trailing: IconButton (
                onPressed: () {
                  Provider.of<CartModel>(context, listen:false).add(item); 
                },
                icon: Icon(Icons.add_shopping_cart)
              ),
            ),
          );
        },
      ),
    );
  }
}