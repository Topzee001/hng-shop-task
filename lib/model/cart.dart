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
        name: 'Golden Watch',
        price: 199.99,
        imageUrl: 'assets/closeup-shot-golden-watch-isolated.png'),
    Product(
        id: '2',
        name: 'Elegant Watch',
        price: 299.99,
        imageUrl:
            'assets/elegant-watch-with-silver-golden-chain-lights-isolated.png'),
    Product(
        id: '3',
        name: 'Smart Watch',
        price: 249.99,
        imageUrl: 'assets/rendering-smart-home-device.png'),
    Product(
        id: '4',
        name: 'Luxury Gold Watch',
        price: 499.99,
        imageUrl: 'assets/stylish-golden-watch-white-surface.png'),
    Product(
        id: '5',
        name: 'Sports Watch',
        price: 149.99,
        imageUrl: 'assets/realistic-fitness-trackers.png'),
    Product(
        id: '6',
        name: 'Elegant watch pro',
        price: 149.99,
        imageUrl: 'assets/elegant-watch-with-silver-golden-chain-isolated.png'),
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
