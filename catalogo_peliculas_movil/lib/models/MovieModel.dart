class MovieModel {
  String id;
  String titulo;
  String sinopsis;
  int year;
  String cover;

  //constructor
  MovieModel({
    required this.id,
    required this.titulo,
    required this.sinopsis,
    required this.year,
    required this.cover,
  });

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'titulo': titulo,
      'sinopsis': sinopsis,
      'year': year,
      'cover': cover,
    };
  }
}
