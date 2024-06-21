import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';

part 'cart_provider.g.dart';

class CartNotifier extends Notifier<Set<Product>> {
  // variable that stores products
  @override
  Set<Product> build() {
    return const {
      Product(
          id: "4",
          title: "Red Backpack",
          price: 14,
          image: "assets/products/backpack.png")
    };
  }

  // method used to add a product, if it's not already in shopping list
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  // method used to remove a product from the list
  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((prod) => prod.id != product.id).toSet();
    }
  }
}

// returns product list with functions used to add/remove products
final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});

// creates a total price, depending on items in cart and their price
@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);

  int total = 0;

  for (Product product in cartProducts) {
    total += product.price;
  }

  return total;
}
