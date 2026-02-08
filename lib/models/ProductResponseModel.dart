class ProductResponseModel {
  final String title;
  final String id;
  final String price;

  const ProductResponseModel({
    required this.title,
    required this.id,
    required this.price,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      title: json['title']?.toString() ?? '',
      id: json['id']?.toString() ?? '',
      price: json['price']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'id': id, 'price': price};
  }
}
