import 'package:catalogo_peliculas_movil/crear.dart';
import 'package:catalogo_peliculas_movil/detalle.dart';
import 'package:catalogo_peliculas_movil/edit.dart';
import 'package:catalogo_peliculas_movil/welcome.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_peliculas_movil/home.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/crear': (BuildContext context) => Crear(),
        '/editar': (BuildContext context) => Editar(),
      },
    );
  }
}
