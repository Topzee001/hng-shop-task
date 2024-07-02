import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartModel extends ChangeNotifier {
  final List<Product> _shopItems = [
    Product(
        id: '1',
        name: 'Classic Chronograph',
        price: 199.99,
        imageUrl: 'assets/images/watches/classic_chronograph.png'),
    Product(
        id: '2',
        name: 'Smart Watch Pro',
        price: 299.99,
        imageUrl: 'assets/images/watches/smart_watch_pro.png'),
    Product(
        id: '3',
        name: 'Diver\'s Watch',
        price: 249.99,
        imageUrl: 'assets/images/watches/divers_watch.png'),
    Product(
        id: '4',
        name: 'Luxury Gold Watch',
        price: 499.99,
        imageUrl: 'assets/images/watches/luxury_gold_watch.png'),
    Product(
        id: '5',
        name: 'Sports Watch',
        price: 149.99,
        imageUrl: 'assets/images/watches/sports_watch.png'),
  ];

  List<Product> get shopItems => _shopItems;

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
