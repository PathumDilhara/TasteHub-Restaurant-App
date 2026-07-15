class PromoCardModel {
  final String promoId;
  final String promoDescription;
  final String promoImageUrl;

  PromoCardModel({
    required this.promoId,
    required this.promoDescription,
    required this.promoImageUrl,
  });

  factory PromoCardModel.fromJson(Map<String, dynamic> json) {
    return PromoCardModel(
      promoId: json["promoId"],
      promoDescription: json["promoDescription"],
      promoImageUrl: json["promoImageUrl"],
    );
  }
}
