import 'package:flutter/material.dart';

class Detalle extends StatelessWidget {
  const Detalle({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          child: Text('Aqui ira el detalle de pelicula'),
        ),
      ),
    );
  }
}
