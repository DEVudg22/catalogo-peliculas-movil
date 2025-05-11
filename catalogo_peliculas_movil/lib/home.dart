import 'package:flutter/material.dart';
import 'package:catalogo_peliculas_movil/services/MovieService.dart';
import 'package:catalogo_peliculas_movil/models/MovieModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late Future<List<MovieModel>> movies;

  @override
  void initState() {
    super.initState();
    movies = MovieService().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 189, 194, 217),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 154, 154, 154),
        title: Text('ES CINE -BETA-'),
        actions: <Widget>[],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Text('Menu')),
            ListTile(title: Text('Agregar pelicula')),
            ListTile(
              title: Text('Salir'),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
          ],
        ),
      ),

      //Area donde se mostraran las peliculas
      body: FutureBuilder<List<MovieModel>>(
        future: movies,
        builder: (context, snap) {
          return ListView.builder(
            itemCount: snap.data?.length,
            itemBuilder: (context, i) {
              return Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/detalle');
                    print('click');
                  },
                  child: Card(
                    color: Colors.blueGrey,
                    child: Column(
                      children: [
                        Image.network(
                          'https://static.vecteezy.com/system/resources/previews/012/657/549/non_2x/illustration-negative-film-reel-roll-tapes-for-movie-cinema-video-logo-vector.jpg',
                          width: 300,
                          height: 225,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          snap.data![i].name,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
