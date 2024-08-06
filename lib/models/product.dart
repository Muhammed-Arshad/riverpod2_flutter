class Product{
  const Product({
    required this.title,
    required this.price,
    required this.image,
    required this.id,
  });

  final String id;
  final String title;
  final int price;
  final String image;
}