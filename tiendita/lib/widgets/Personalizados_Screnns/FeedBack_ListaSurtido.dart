import 'package:flutter/material.dart';

class FBListaSurtido extends StatefulWidget {
  const FBListaSurtido({super.key});

  @override
  State<FBListaSurtido> createState() => _FBListaSurtidoState();
}

class _FBListaSurtidoState extends State<FBListaSurtido> {
  final double padings_H = 40;
  final double padings_V = 25;

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;
    return Container(
     // height: pantalla.height*.40,
      width: pantalla.width,

      //DECORACIONES
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(18),bottomRight: Radius.circular(18), bottomLeft: Radius.elliptical(10,6),topRight: Radius.elliptical(10,6))
      ),

      //Contenido
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal:padings_H,vertical: 15),
            alignment: Alignment.centerLeft,
            child: Text('Detalles')),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padings_H, vertical:5 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Titulo
                Text('Productos por comprar'),
                //Contenido que cambia XD
                Text('Cant')
              ],
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: padings_H, vertical:5 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Titulo
                Text('Fecha'),
                //Contenido que cambia XD
                Text('hoy Xdd')
              ],
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: padings_H, vertical:5 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Titulo
                Text('Precio estimado'),
                //Contenido que cambia XD
                Text('un peso')
              ],
            ),
          ),
          SizedBox( height: 15,)
        ],
      ),
    );
  }
}