import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  // cart screen stateful widget, rebuilds on change
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(
        cartNotifierProvider); // variable used to access products in cart
    final total =
        ref.watch(cartTotalProvider); // variable used for display total price

    return Scaffold(
      appBar: AppBar(
        // top app bar and app bar text
        title: const Text('Your Cart'),
        centerTitle: true,
      ),
      body: Container(
        // page content
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartProducts.map((product) {
                // creates an element for each product
                return Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Image.asset(product.image,
                          width: 60, height: 60), // product image
                      const SizedBox(width: 10),
                      Text("${product.title}..."), // product name
                      const Expanded(child: SizedBox()),
                      Text("\$${product.price}") // product price
                    ],
                  ),
                );
              }).toList(), // output cart products here
            ),
            Text("The total is - \$$total")
            // outputs total price
          ],
        ),
      ),
    );
  }
}
