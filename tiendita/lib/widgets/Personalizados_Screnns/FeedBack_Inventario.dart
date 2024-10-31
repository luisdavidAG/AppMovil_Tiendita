import 'package:flutter/material.dart';

class FBInventario extends StatefulWidget {
  const FBInventario({super.key});

  @override
  State<FBInventario> createState() => _FBInventarioState();
}

class _FBInventarioState extends State<FBInventario> {
  final double padings_H = 40;
  final double padings_V = 25;
  late String formattedDate;

  //TODO ASIGNAR VARIABLES
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    List<String> days = [
      "Domingo",
      "Lunes",
      "Martes",
      "Miércoles",
      "Jueves",
      "Viernes",
      "Sábado"
    ];
    List<String> months = [
      "enero",
      "febrero",
      "marzo",
      "abril",
      "mayo",
      "junio",
      "julio",
      "agosto",
      "septiembre",
      "octubre",
      "noviembre",
      "diciembre"
    ];

    String dayOfWeek = days[now.weekday - 1];
    String day = now.day.toString().padLeft(2, '0');
    String month = months[now.month - 1];
    String year = now.year.toString();
    formattedDate = "$dayOfWeek $day de $month $year";
  }

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;

    return Container(
      width: pantalla.width,
      padding: EdgeInsets.symmetric(horizontal: padings_H),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF8A6DE9), Color(0xFF5C5DE9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      // Contenido
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          //FECHA
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                formattedDate.split(" ")[0] + " ",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                formattedDate.substring(formattedDate.indexOf(" ") + 1),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          //Titulo Carta
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: const Text(
                'Detalles de \nTu Inventario',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.white70),
              ),
            ),
          ),
          //Contenedores
          //Caractesiticas
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Contenedor Productos
              Container(
                height: pantalla.height * .15,
                width: pantalla.width * .20,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(15),
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFF1A1A1A),
                      Color(0xFF000000).withOpacity(0.7),
                    ],
                    radius: 1.5,
                    center: Alignment.center,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        //Variable de productos
                        //count de los productos del inventario Num_Pro
                        '200',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Text(
                            'Productos',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 10),
                          ),
                          Text(
                            'Existentes',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Contenedor Bajo Stock
              Container(
                height: pantalla.height * .15,
                width: pantalla.width * .20,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(15),
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFF1A1A1A),
                      Color(0xFF000000).withOpacity(0.7),
                    ],
                    radius: 1.5,
                    center: Alignment.center,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        //Variable de productos Bajo Stock
                        //count de los productos del inventario STk_Bajo
                        '5',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Text(
                            'Productos',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 10),
                          ),
                          Text(
                            'En Bajo Stock',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Contenedor Ofertas Activas
              Container(
                height: pantalla.height * .15,
                width: pantalla.width * .20,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(15),
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFF1A1A1A),
                      Color(0xFF000000).withOpacity(0.7),
                    ],
                    radius: 1.5,
                    center: Alignment.center,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        //Variable de productos Bajo Stock
                        //count de los productos del inventario Ofr_Alt
                        '2',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Text(
                            'Ofertas',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 10),
                          ),
                          Text(
                            'Activas',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
