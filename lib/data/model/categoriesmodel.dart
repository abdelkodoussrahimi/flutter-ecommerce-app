class Categoriesmodel {
  String? categorisId;
  String? categorisName;
  String? categorisImage;
  String? categorisDatetime;

  Categoriesmodel(
      {this.categorisId,
      this.categorisName,
      this.categorisImage,
      this.categorisDatetime});

  Categoriesmodel.fromJson(Map<String, dynamic> json) {
    categorisId = json['categoris_id'];
    categorisName = json['categoris_name'];
    categorisImage = json['categoris_image'];
    categorisDatetime = json['categoris_datetime'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['categoris_id'] = categorisId;
    data['categoris_name'] = categorisName;
    data['categoris_image'] = categorisImage;
    data['categoris_datetime'] = categorisDatetime;
    return data;
  }
}
