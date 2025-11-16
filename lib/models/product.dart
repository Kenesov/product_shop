class Product {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;
  final int reviewCount;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.rating = 4.5,
    this.reviewCount = 124,
  });
}