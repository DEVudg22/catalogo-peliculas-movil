class MovieModel {
  int id;
  String name;
  MovieModel({required this.id, required this.name});

  factory MovieModel.fromJson(Map json) {
    return MovieModel(id: json['id'], name: json['name']);
  }
}
