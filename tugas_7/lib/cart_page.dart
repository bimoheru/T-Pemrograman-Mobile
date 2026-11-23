import 'package:flutter/material.dart';
import 'package:tugas_7/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('Keranjang'),
      ),
      body: Consumer<CartModel> (
        builder: (context, cart, child) {
          if(cart.items.isEmpty) {
            return Center(
              child: Text('Kosong WLEEE belanja dulu gih'),
            );
          }

          return ListView.builder (
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return Card (
                margin: EdgeInsets.all(5),
                child: ListTile (
                  leading: Icon(Icons.shopping_bag),
                  title: Text(item.nama),
                  subtitle: Text(item.deskripsi),
                  trailing: TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    onPressed: () {
                      cart.remove(item);
                    },
                    icon: Icon(Icons.delete),
                    label: Text('Hapus'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}