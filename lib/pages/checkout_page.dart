import 'package:flutter/material.dart';
import 'package:hng_shoping_app/model/cart.dart';

class MyCheckoutPage extends StatelessWidget {
  const MyCheckoutPage({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Checkout Page'),
        ),
        body: ListView.builder(
          itemCount: cartModel.cartItems.length,
          itemBuilder: ((context, index) {}),
        ));
  }
}
