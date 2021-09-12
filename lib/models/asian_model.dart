class AsianModel {
  String title;
  String image;
  String year;

  AsianModel({
    this.year,
    this.image,
    this.title,
  });

  AsianModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    year = json['year'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'year': year,
      'title': title,
    };
  }
}
