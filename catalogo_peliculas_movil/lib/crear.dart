import 'package:catalogo_peliculas_movil/services/MovieService.dart';
import 'package:flutter/material.dart';

class Crear extends StatefulWidget {
  const Crear({super.key});

  @override
  State<Crear> createState() => _CrearState();
}

class _CrearState extends State<Crear> {
  //controladores que reciben datos de los inputs
  TextEditingController tituloController = TextEditingController(text: "");
  TextEditingController sinopsisController = TextEditingController(text: "");
  TextEditingController yearController = TextEditingController(text: "");
  TextEditingController directorController = TextEditingController(text: "");
  TextEditingController generoController = TextEditingController(text: "");
  TextEditingController coverController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar nueva pelicula')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //Campo Titulo
            TextField(
              decoration: const InputDecoration(hintText: 'Titulo'),
              controller: tituloController,
            ),
            //Campo Sinopsis
            TextField(
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Sinopsis',
                contentPadding: EdgeInsets.symmetric(vertical: 40),
              ),
              controller: sinopsisController,
            ),
            //Campo year
            TextField(
              decoration: const InputDecoration(hintText: 'Año'),
              controller: yearController,
            ),
            //Campo director
            TextField(
              decoration: const InputDecoration(hintText: 'Director'),
              controller: directorController,
            ),
            //Campo genero
            TextField(
              decoration: const InputDecoration(hintText: 'Género'),
              controller: generoController,
            ),
            //Campo carátula
            TextField(
              decoration: const InputDecoration(hintText: 'Carátula'),
              controller: coverController,
            ),

            //Boton para agregar pelicula
            ElevatedButton(
              onPressed: () async {
                await storeMovie(
                  tituloController.text,
                  sinopsisController.text,
                  yearController.text,
                  directorController.text,
                  generoController.text,
                  coverController.text,
                ).then((_) {
                  Navigator.pushNamed(context, '/home');
                });
                //despues de guardar pelicula regresa a home
              },
              child: Text('Agregar'),
            ),
          ],
        ),
      ),
    );
  }
}
