import 'package:catalogo_peliculas_movil/detalle.dart';
import 'package:catalogo_peliculas_movil/welcome.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_peliculas_movil/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalogo de peliculas movil',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Welcome(),
        '/home': (BuildContext context) => Home(),
        '/detalle': (BuildContext context) => Detalle(),
      },
    );
  }
}
