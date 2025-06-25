class ProductModel {
  final int? id;
  final String title;
  final num price;
  final List<String> images;
  final String description;
  final num categoryId;

  ProductModel({
    this.id,
    required this.description,
    required this.categoryId,
    required this.title,
    required this.price,
    required this.images,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      images: List<String>.from(json['images'] ?? []),
      description: json['description'],
      categoryId: json['category']['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'images': images,
      'description': description,
      'categoryId': categoryId,
    };
  }
}
