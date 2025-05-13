import 'package:catalogo_peliculas_movil/services/MovieService.dart';
import 'package:flutter/material.dart';

class Editar extends StatefulWidget {
  const Editar({super.key});

  @override
  State<Editar> createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  //controladores que reciben datos de los inputs
  TextEditingController tituloController = TextEditingController(text: "");
  TextEditingController sinopsisController = TextEditingController(text: "");
  TextEditingController yearController = TextEditingController(text: "");
  TextEditingController directorController = TextEditingController(text: "");
  TextEditingController generoController = TextEditingController(text: "");
  TextEditingController coverController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    //variable que recibe los parametros en la ruta
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    //asignacion de los argumentos a los controladores
    tituloController.text = arguments['titulo'];
    sinopsisController.text = arguments['sinopsis'];
    yearController.text = arguments['year'].toString();
    directorController.text = arguments['director'];
    generoController.text = arguments['genero'];
    coverController.text = arguments['cover'];

    return Scaffold(
      appBar: AppBar(title: const Text('Editar película')),
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
                await updateMovie(
                  arguments['id'],
                  tituloController.text,
                  sinopsisController.text,
                  yearController.text,
                  directorController.text,
                  generoController.text,
                  coverController.text,
                ).then((_) {
                  Navigator.pushNamed(
                    context,
                    '/detalle',
                    arguments: {
                      "id": arguments['id'],
                      "titulo": tituloController.text,
                      "sinopsis": sinopsisController.text,
                      "year": yearController.text,
                      "director": directorController.text,
                      "genero": generoController.text,
                      "cover": coverController.text,
                    },
                  );
                });
              },
              child: Text('Actualizar'),
            ),
          ],
        ),
      ),
    );
  }
}
