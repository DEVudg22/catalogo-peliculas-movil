import 'package:flutter/material.dart';
import 'package:catalogo_peliculas_movil/services/MovieService.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
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
            ListTile(
              title: Text('Agregar pelicula'),
              onTap: () async {
                await Navigator.pushNamed(context, '/crear');
                setState(() {});
              },
            ),
            ListTile(
              title: Text('Salir'),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
          ],
        ),
      ),

      //Area donde se mostraran las peliculas
      body: FutureBuilder(
        future: getMovies(),
        builder: (context, snap) {
          return ListView.builder(
            itemCount: snap.data?.length,
            itemBuilder: (context, i) {
              return Center(
                child: InkWell(
                  onTap: () async {
                    await Navigator.pushNamed(
                      context,
                      '/detalle',
                      arguments: {
                        "id": snap.data?[i]['id'],
                        "titulo": snap.data?[i]['titulo'],
                        "sinopsis": snap.data?[i]['sinopsis'],
                        "year": snap.data?[i]['year'],
                        "director": snap.data?[i]['director'],
                        "genero": snap.data?[i]['genero'],
                        "cover": snap.data?[i]['cover'],
                      },
                    );
                  },
                  child: Card(
                    color: Colors.blueGrey,
                    child: Column(
                      children: [
                        Image.network(
                          snap.data?[i]['cover'],
                          width: 225,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          snap.data?[i]['titulo'] +
                              ' ' +
                              '(' +
                              snap.data?[i]['year'].toString() +
                              ')',

                          style: TextStyle(
                            fontSize: 15,
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
