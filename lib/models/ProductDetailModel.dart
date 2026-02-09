class ProductDetailModel {
  final String id;
  final String title;
  final String price;
  final double rating;
  final String brand;

  const ProductDetailModel({
    required this.id,
    required this.title,
    required this.price,
    required this.brand,
    required this.rating,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      price: json['price']?.toString() ?? '',
      brand: json['brand']?.toString() ?? 'N/A',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'brand': brand,
      'rating': rating,
    };
  }
}
