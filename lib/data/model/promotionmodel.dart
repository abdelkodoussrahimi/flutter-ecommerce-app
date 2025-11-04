class Promotionmodel {
  String? promotionId;
  String? promotionTitel;
  String? promotionTitelbody;
  String? promotionImage;
  String? promotionDatetime;

  Promotionmodel(
      {this.promotionId,
      this.promotionTitel,
      this.promotionTitelbody,
      this.promotionImage,
      this.promotionDatetime});

  Promotionmodel.fromJson(Map<String, dynamic> json) {
    promotionId = json['promotion_id'];
    promotionTitel = json['promotion_titel'];
    promotionTitelbody = json['promotion_titelbody'];
    promotionImage = json['promotion_image'];
    promotionDatetime = json['promotion_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promotion_id'] = this.promotionId;
    data['promotion_titel'] = this.promotionTitel;
    data['promotion_titelbody'] = this.promotionTitelbody;
    data['promotion_image'] = this.promotionImage;
    data['promotion_datetime'] = this.promotionDatetime;
    return data;
  }
}
