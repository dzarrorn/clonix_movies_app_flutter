class TheatersModel {
  String title;
  String image;
  String genres;

  TheatersModel({
    this.genres,
    this.image,
    this.title,
  });

  TheatersModel.fromJson(Map<String, dynamic> json) {
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
