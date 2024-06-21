class Product {
  const Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.image});

  final String id; // product id, used for logic
  final String title; // product name
  final int price; // product price
  final String image; // product image
}
