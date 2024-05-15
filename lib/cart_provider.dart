import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, Object>> cart = [];

  void addProduct(Map<String, Object> product) {
    cart.add(product);
  }

  void removeProduct(Map<String, Object> product) {
    cart.remove(product);
  }
}
