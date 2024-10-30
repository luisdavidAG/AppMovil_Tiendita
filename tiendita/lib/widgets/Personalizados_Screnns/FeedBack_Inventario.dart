import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FBInventario extends StatefulWidget {
  const FBInventario({super.key});

  @override
  State<FBInventario> createState() => _FBInventarioState();
}

class _FBInventarioState extends State<FBInventario> {
  final double padings_H = 40;
  final double padings_V = 25;
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    // Obtenemos la fecha actual y la formateamos
    DateTime now = DateTime.now();
    formattedDate = DateFormat('EEEE, d MMMM yyyy', 'es_ES').format(now); // "viernes, 8 de mayo de 2023"
  }

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      body: Container(
        width: pantalla.width,

        // DECORACIONES
        decoration: BoxDecoration(
          color: Colors.blueAccent[100], // Cambié el color para ver el contenedor
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
            bottomLeft: Radius.elliptical(10, 6),
            topRight: Radius.elliptical(10, 6),
          ),
        ),

        // Contenido
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padings_H),
              child: Container(
                height: pantalla.height * .10,
                width: pantalla.width,
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padings_H),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Tu Tienda',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(formattedDate), // Mostramos la fecha actual
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: padings_H, vertical: 15),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Detalles de \nTu Inventario',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padings_H, vertical: 5),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tu inventario'),
                  Text('Num_Productos'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padings_H, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Tu inventario'),
                  Text('Num_Productos'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padings_H, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Tu inventario'),
                  Text('Num_Productos'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}