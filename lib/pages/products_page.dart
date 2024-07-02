import 'package:flutter/material.dart';

import '../model/cart.dart';

class MyProductPage extends StatelessWidget {
  final CartModel cartModel;
  const MyProductPage({super.key, required this.cartModel});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('product page'),
      ),
    );
  }
}
