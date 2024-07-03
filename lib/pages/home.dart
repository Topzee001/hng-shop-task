import 'package:flutter/material.dart';
import 'package:hng_shoping_app/pages/checkout_page.dart';
import 'package:hng_shoping_app/pages/products_page.dart';

import '../model/cart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final CartModel _cartModel = CartModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          MyProductPage(
            cartModel: _cartModel,
          ),
          MyCheckoutPage(
            cartModel: _cartModel,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.watch), label: 'Produccts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
    );
  }
}
