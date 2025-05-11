import 'package:flutter/material.dart';

class Detalle extends StatelessWidget {
  const Detalle({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('TÍTULO DE LA PELÍCULA')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://static.vecteezy.com/system/resources/previews/012/657/549/non_2x/illustration-negative-film-reel-roll-tapes-for-movie-cinema-video-logo-vector.jpg',
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam magna ante, pulvinar et dolor et, hendrerit blandit tortor. Nullam pulvinar leo quis nibh luctus venenatis. Cras at mauris sapien. Fusce nisi sapien, ultrices eget dapibus tristique, commodo non enim. Nunc sit amet erat vel orci maximus volutpat id laoreet est. Integer neque dolor, tincidunt ut lorem eget, fermentum vehicula lacus. Etiam non urna eget ante mollis elementum eget et odio. Ut tincidunt mi purus, id ultrices ante porttitor at.',
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
