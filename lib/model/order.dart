class Order {
  final int id;
  final String productName;
  final double productPrice;
  final int quantity;
  final String imageUrl;

  Order({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.productPrice,
    required this.imageUrl,
  });
}
