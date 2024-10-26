import 'package:flutter/material.dart';
//Variable global
late Size pantalla;

class ConsultarProductos extends StatelessWidget {
  const ConsultarProductos({super.key});

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
          Text('hola2'),
        ],
      ),

    ),
  );
}
