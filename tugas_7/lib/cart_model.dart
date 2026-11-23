import 'package:flutter/material.dart';

class Product {
  final String nama, deskripsi;

  Product(this.nama, this.deskripsi);
}

class CartModel extends ChangeNotifier {
  final List<Product> _items = []; 

  List<Product> get items => _items;
  int get totalItems => _items.length;

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void removeAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}