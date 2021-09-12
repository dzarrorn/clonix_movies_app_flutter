class PopularModel {
  String title;
  String image;
  String year;

  PopularModel({
    this.year,
    this.image,
    this.title,
  });

  PopularModel.fromJson(Map<String, dynamic> json) {
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
