import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class FBProductos extends StatefulWidget {
  const FBProductos({super.key});

  @override
  State<FBProductos> createState() => _FBProductosState();
}

class _FBProductosState extends State<FBProductos> {
  final double padings_H = 40;
  final double padings_V = 25;
  late String formattedDate;


  //TODO hacer las consultas y agregarlas a varibles para ponerlas correspondientemente
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    List<String> days = ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];
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

    String dayOfWeek = days[now.weekday % 7];
    String day = now.day.toString().padLeft(2, '0');
    String month = months[now.month - 1];
    String year = now.year.toString();
    formattedDate = "$dayOfWeek, $day de $month $year";
  }

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;
    return Container(
      width: pantalla.width,

      // DECORACIONES del feedback
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
          const SizedBox(height: 10),
          
          // Fecha en la parte superior
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padings_H),
            child: Row(
              children: [
                Text(
                  formattedDate.split(" ")[0] + " ",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  formattedDate.substring(formattedDate.indexOf(" ") + 1),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // Título principal
          Container(
            margin: EdgeInsets.symmetric(horizontal: padings_H, vertical: 15),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Detalles de Productos',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          
          // Primer campo: Productos por comprar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padings_H),
            child: Container(
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Título
                        SizedBox(
                          width: pantalla.width * .40,
                          child: const Text(
                            'Productos Próximos a Vencer',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Contenido que cambia XD
                        const Text(
                          'Cant',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
            
                  // Segundo campo: Fecha
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Título
                        SizedBox(
                          width: pantalla.width * .40,
                          child: const Text(
                            'Productos Sin Ventas',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Contenido que cambia XD
                        const Text(
                          'Lista',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
            
                  // Tercer campo: Precio estimado
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Título
                        SizedBox(
                          width: pantalla.width * .40,
                          child: const Text(
                            'Productos Agregados Recientemente',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Contenido que cambia XD
                        const Text(
                          'Lista',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),          
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}


//Consultas

//Produtos sin ventas

// SELECT p.nombre_producto, p.cantidad
// FROM productos p
// LEFT JOIN ventas v ON p.id_producto = v.id_producto AND v.fecha_venta > DATE_SUB(CURDATE(), INTERVAL 30 DAY)
// WHERE v.id_producto IS NULL
// LIMIT 3;


//Productos agregado

// SELECT nombre_producto, cantidad, fecha_agregado
// FROM productos
// ORDER BY fecha_agregado DESC
// LIMIT 3;
