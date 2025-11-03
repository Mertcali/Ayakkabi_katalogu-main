import 'package:flutter/material.dart';
import '../models/shoe_model.dart';

class CartItem {
  final ShoeModel shoe;
  int quantity; // Koli adedi

  CartItem({
    required this.shoe,
    this.quantity = 1,
  });
}

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  void addToCart(ShoeModel shoe) {
    // Check if item already exists
    final existingIndex = _items.indexWhere(
      (item) => item.shoe.id == shoe.id,
    );

    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(
        shoe: shoe,
      ));
    }
    notifyListeners();
  }

  void removeFromCart(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void updateQuantity(int index, int newQuantity) {
    if (newQuantity > 0) {
      _items[index].quantity = newQuantity;
      notifyListeners();
    } else {
      removeFromCart(index);
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

