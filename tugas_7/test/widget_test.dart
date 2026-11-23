import 'package:flutter_test/flutter_test.dart';
import 'package:tugas_7/cart_model.dart';

void main() {
  test('CartModel add and remove items', () {
    final cart = CartModel();
    final product = Product('Minyak Goreng', 'Minyak goreng dari sawit aseli');

    expect(cart.totalItems, 0);

    cart.add(product);
    expect(cart.totalItems, 1);
    expect(cart.items.contains(product), true);

    cart.remove(product);
    expect(cart.totalItems, 0);
    expect(cart.items.isEmpty, true);
  });
}
