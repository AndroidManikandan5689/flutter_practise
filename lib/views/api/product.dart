class Product {
  final String title;
  final String description;
  final double price;
  final String image;

  Product(this.title, this.description, this.price, this.image);
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      json['title'],
      json['description'],
      json['price'],
      json['image'],
    );
  }
}
