import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:catalogo_peliculas_movil/models/MovieModel.dart';

class MovieService {
  static const url = 'https://jsonplaceholder.typicode.com';
  final String endPoint = '/users';

  Future<List<MovieModel>> getMovies() async {
    //respuesta en texto
    final res = await http.get(Uri.parse('$url$endPoint'));
    //conversion a lista
    final obj = List.from(jsonDecode(res.body));
    List<MovieModel> moviesList = [];
    //Iteracion de la lista
    obj.forEach((element) {
      final MovieModel movie = MovieModel.fromJson(element as Map);
      moviesList.add(movie);
    });
    return moviesList;
  }
}
