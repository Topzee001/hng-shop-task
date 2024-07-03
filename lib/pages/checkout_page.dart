import 'package:flutter/material.dart';
import 'package:hng_shoping_app/model/cart.dart';

import 'home.dart';
import 'order_success_page.dart';

class MyCheckoutPage extends StatefulWidget {
  const MyCheckoutPage({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  State<MyCheckoutPage> createState() => _MyCheckoutPageState();
}

class _MyCheckoutPageState extends State<MyCheckoutPage> {
  @override
  void initState() {
    super.initState();
    widget.cartModel.addListener(_onCartChanged);
  }

  @override
  void dispose() {
    widget.cartModel.removeListener(_onCartChanged);
    super.dispose();
  }

  void _onCartChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Checkout'),
        ),
        body: widget.cartModel.cartItems.isEmpty
            ? const Center(
                child: Text(
                  'Item not added to cart',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.cartModel.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = widget.cartModel.cartItems[index];
                        return ListTile(
                          leading: Image.asset(
                            item.product.imageUrl,
                            height: 140,
                          ),
                          title: Text(item.product.name),
                          subtitle: Text(
                            '\$${item.product.price.toStringAsFixed(2)}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_shopping_cart),
                            onPressed: () => widget.cartModel
                                .removeItemFromCart(item.product.id),
                          ),
                        );
                      },
                    ),
                  ),
                  if (widget.cartModel.cartItems.isNotEmpty)
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.purple,
                            ),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Checkout',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        widget.cartModel.clearCart();
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const MyOrderSuccess()),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
                ],
              ),
      ),
    );
  }
}
