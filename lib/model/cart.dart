import 'package:flutter/material.dart';
import 'package:hng_shoping_app/model/cart_item.dart';
import 'package:hng_shoping_app/model/product.dart';

class CartModel extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItemToCart(Product product) {
    //_cartItems.add(product.id as CartItem);
    var existingItem = _cartItems.firstWhere(
      (cartItem) => cartItem.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      _cartItems.add(existingItem);
    }
    existingItem.quantity++;

    notifyListeners();
  }

  void removeItemFromCart(String productId) {
    _cartItems.removeWhere((cartItem) => cartItem.product.id == productId);

    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(
        0, (sum, cartItem) => (cartItem.product.price * cartItem.quantity));
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
