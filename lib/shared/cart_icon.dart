import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/screens/cart/cart_screen.dart';

class CartIcon extends ConsumerWidget {
  // cart icon widget with number of items
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemCount = ref
        .watch(cartNotifierProvider)
        .length; // variable gotten from provider, used to display number of items

    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CartScreen(); // navigates to cart screen on tap
            }));
          },
          icon: const Icon(Icons.shopping_bag_outlined), // cart icon
        ),
        Positioned(
          // bubble with cart item total
          top: 5,
          left: 5,
          child: Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
            ),
            child: Text(
              "$cartItemCount", //cart total number count
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
