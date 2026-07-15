class FoodModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;
  final int reviews;
  final bool isPopular;
  final bool isRecommended;
  final String preparationTime;
  final List<String> ingredients;


  FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.rating,
    required this.reviews,
    required this.isPopular,
    required this.isRecommended,
    required this.preparationTime,
    required this.ingredients,
  });


  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'],
      category: json['category'],
      rating: (json['rating'] as num).toDouble(),
      reviews: json['reviews'],
      isPopular: json['isPopular'],
      isRecommended: json['isRecommended'],
      preparationTime: json['preparationTime'],
      ingredients: List<String>.from(
        json['ingredients'],
      ),
    );
  }
}