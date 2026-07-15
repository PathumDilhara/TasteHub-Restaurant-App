class CategoryCardModel {
  final String categoryId;
  final String categoryName;
  final String categoryImageUrl;

  CategoryCardModel({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImageUrl,
  });

  factory CategoryCardModel.fromJson(Map<String, dynamic> json) {
    return CategoryCardModel(
      categoryId: json["categoryId"],
      categoryName: json["categoryName"],
      categoryImageUrl: json["categoryImageUrl"],
    );
  }
}
