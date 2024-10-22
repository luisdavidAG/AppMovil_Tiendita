import 'package:flutter/material.dart';

// Declara la variable pantalla global
late Size pantalla;

class TuInventario extends StatefulWidget {
  const TuInventario({super.key});

  @override
  State<TuInventario> createState() => _TuInventarioState();
}

class _TuInventarioState extends State<TuInventario> {
  @override
  Widget build(BuildContext context) {
    // Asigna el tamaño de la pantalla a la variable global
    pantalla = MediaQuery.of(context).size;
    //aqui se piden las o las sentencias sql
    //imagen xddd
    return inventario(context,'Url',);
  }
}

//aqui se piden y se acomodan las varibles
//context es para pedirl las cosas de themes
Widget inventario(BuildContext context, String url,) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0 , right: 15.0),
    child: Container(
      height: pantalla.height,
      width: pantalla.width,
      //Decoraciones
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue
      ),
      //Contenido de la carta
      child: Row(
        children: [
          //Foto
          Container(
            width: pantalla.width*.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),bottomLeft:Radius.circular(20.0)),
              color: Colors.tealAccent,
                image: DecorationImage(
                  image: AssetImage(url),
                  fit: BoxFit.cover,
                ),
                ),
          ),
          //Texto
          const Column (
            children: [
              //Caracteristica 1
              //Caracteristica 2
            ],
          ),
        ],
      ),
    ),
  );
}
