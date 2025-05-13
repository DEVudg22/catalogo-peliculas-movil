import 'package:catalogo_peliculas_movil/services/MovieService.dart';
import 'package:flutter/material.dart';

class Detalle extends StatelessWidget {
  const Detalle({super.key});
  @override
  Widget build(BuildContext context) {
    //variable que recibe los parametros en la ruta
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(arguments['titulo']),
        leading: IconButton(
          icon: Icon(Icons.close), // Icono de cerrar
          onPressed: () {
            Navigator.pushNamed(context, '/home'); // Vuelve a la ruta anterior
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Image.network(arguments['cover'], width: 225, height: 300),
              Text(
                'SINOPSIS \n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(arguments['sinopsis'] + '\n', textAlign: TextAlign.justify),
              Text('AÑO: ' + arguments['year'].toString()),

              Text('DIRECTOR: ' + arguments['director']),
              Text('GÉNERO: ' + arguments['genero']),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 25.0,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await Navigator.pushNamed(
                        context,
                        '/editar',
                        arguments: {
                          "id": arguments['id'],
                          "titulo": arguments['titulo'],
                          "sinopsis": arguments['sinopsis'],
                          "year": arguments['year'],
                          "director": arguments['director'],
                          "genero": arguments['genero'],
                          "cover": arguments['cover'],
                        },
                      );
                    },
                    child: Text('Editar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Estás seguro?',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 25.0,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancelar'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await deleteMovie(arguments['id']).then((
                                        _,
                                      ) {
                                        Navigator.pushNamed(context, '/home');
                                      });
                                    },
                                    child: Text('Borrar'),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Borrar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
