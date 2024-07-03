import 'package:flutter/material.dart';

import '../model/cart.dart';

class MyProductPage extends StatelessWidget {
  final CartModel cartModel;
  const MyProductPage({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Shop your watches'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: cartModel.shopItems.length,
          itemBuilder: (context, index) {
            final product = cartModel.shopItems[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      product.imageUrl,
                      height: 130,
                    ),
                    Text(
                      product.name,
                      style:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.grey.shade300),
                        ),
                        onPressed: () {
                          cartModel.addItemToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('${product.name} added to cart')),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.shopping_cart),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Add to Cart',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              //Spacer(),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
