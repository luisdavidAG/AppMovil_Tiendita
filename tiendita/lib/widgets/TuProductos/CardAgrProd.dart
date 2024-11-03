import 'package:flutter/material.dart';
//Variable global
late Size pantalla;
late String crud;

class AgrTusProductos extends StatefulWidget {
  const AgrTusProductos({super.key});

  @override
  State<AgrTusProductos> createState() => _AgrTusProductosState();
}

class _AgrTusProductosState extends State<AgrTusProductos> {
  @override
  Widget build(BuildContext context) {
    pantalla = MediaQuery.of(context).size;
    return productos(context);
  }
}

Widget productos(BuildContext context){
  return Padding(
    padding: const EdgeInsets.only(left: 15.0 , right: 15.0),
    child: Container(
      width: pantalla.width,
      height: pantalla.height,
      //Decoraciones
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue
      ),

      //Contenido de la carta
      child: Column(
        children: [
          Text('Agregar'),
        ],
      ),

    ),
  );
}

