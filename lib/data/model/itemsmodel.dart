class ItemsModel {
  String? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;
  String? categorisId;
  String? categorisName;
  String? categorisImage;
  String? categorisDatetime;
  String? favorite;

  ItemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsDesc,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat,
      this.categorisId,
      this.categorisName,
      this.categorisImage,
      this.categorisDatetime,
      this.favorite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDesc = json['items_desc'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    categorisId = json['categoris_id'];
    categorisName = json['categoris_name'];
    categorisImage = json['categoris_image'];
    categorisDatetime = json['categoris_datetime'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_desc'] = itemsDesc;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['categoris_id'] = this.categorisId;
    data['categoris_name'] = this.categorisName;
    data['categoris_image'] = this.categorisImage;
    data['categoris_datetime'] = this.categorisDatetime;
    return data;
  }
}
