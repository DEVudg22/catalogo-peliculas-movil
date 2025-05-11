import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getMovies() async {
  List movies = [];
  CollectionReference collection = db.collection('movies');
  QuerySnapshot queryMovies = await collection.get();

  queryMovies.docs.forEach((document) {
    movies.add(document.data());
  });

  return movies;
}
