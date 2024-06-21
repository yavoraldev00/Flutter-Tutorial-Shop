import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/providers/products_provider.dart';
import 'package:riverpod_files/shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  // home screen widget
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts =
        ref.watch(productsProvider); // returns all available products
    final cartProducts =
        ref.watch(cartNotifierProvider); // returns products in cart

    return Scaffold(
      appBar: AppBar(
        // top bar and page name
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()], // cart icon button, with product amount
      ),
      body: Padding(
        // page content
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          // grid for with all available products
          itemCount: allProducts
              .length, // automatically generated depending on total product amount
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            // template for grid item
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                  Image.asset(allProducts[index].image,
                      width: 60, height: 60), // product image
                  Text(allProducts[index].title), // product name
                  Text("\$${allProducts[index].price}"), // product price
                  if (cartProducts.contains(allProducts[
                      index])) // button for adding / removing item in cart depending if it's already in the cart
                    TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .removeProduct(allProducts[index]);
                        },
                        child: const Text("Remove")),
                  if (!cartProducts.contains(allProducts[index]))
                    TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .addProduct(allProducts[index]);
                        },
                        child: const Text("Add to Cart")),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
