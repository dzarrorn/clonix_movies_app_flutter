class SoonModel {
  String title;
  String image;
  String genres;

  SoonModel({
    this.genres,
    this.image,
    this.title,
  });

  SoonModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    genres = json['genres'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'genres': genres,
      'title': title,
    };
  }
}
