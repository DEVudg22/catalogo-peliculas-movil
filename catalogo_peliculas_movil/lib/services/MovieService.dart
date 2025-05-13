import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Obtener todas las peliculas
Future<List> getMovies() async {
  List movies = [];
  CollectionReference collection = db.collection('movies');
  QuerySnapshot queryMovies = await collection.get();
  for (var doc in queryMovies.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final movie = {
      "id": doc.id,
      "titulo": data['titulo'],
      "sinopsis": data['sinopsis'],
      "year": data['year'],
      "director": data['director'],
      "genero": data['genero'],
      "cover": data['cover'],
    };
    movies.add(movie);
  }
  ;
  return movies;
}

//Guardar nueva pelicula
Future<void> storeMovie(
  String titulo,
  String sinopsis,
  String year,
  String director,
  String genero,
  String cover,
) async {
  await db.collection('movies').add({
    "titulo": titulo,
    "sinopsis": sinopsis,
    "year": int.parse(year),
    "director": director,
    "genero": genero,
    "cover": cover,
  });
}

//Actualizar pelicula
Future<void> updateMovie(
  String id,
  String newtitulo,
  String newsinopsis,
  String newyear,
  String newdirector,
  String newgenero,
  String newcover,
) async {
  await db.collection('movies').doc(id).set({
    "titulo": newtitulo,
    "sinopsis": newsinopsis,
    "year": int.parse(newyear),
    "director": newdirector,
    "genero": newgenero,
    "cover": newcover,
  });
}

//Eliminar pelicula
Future<void> deleteMovie(String id) async {
  await db.collection('movies').doc(id).delete();
}
