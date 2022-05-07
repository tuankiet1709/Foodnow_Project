import 'package:tranhatuankiet_18dh110808/cart/components/body.dart';

import 'products.dart';

class Cart {
  int? id;
  String? status;
  DateTime? dateTime;
  double? price;

  Cart(
      {this.id,
      this.dateTime,
      this.status,
      this.price});

  static List<CartItem> cart = [];
  void addProductToCart(Products products, int quantity) {
    CartItem item = new CartItem(product: products, quantity: quantity);
    for (var item in cart) {
      if (item.product.id == products.id) {
        item.quantity += quantity;
        return;
      }
    }
    cart.add(item);
  }

  List<CartItem> getCart() {
    return cart;
  }
}
