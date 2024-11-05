import 'package:flutter/material.dart';

class FBPromociones extends StatefulWidget {
  const FBPromociones({super.key});

  @override
  State<FBPromociones> createState() => _FBPromocionesState();
}

class _FBPromocionesState extends State<FBPromociones> {
  final double padings_H = 40;
  final double padings_V = 25;
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    List<String> days = ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];
    List<String> months = [
      "enero", "febrero", "marzo", "abril", "mayo", "junio",
      "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"
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
              'Detalles de Promociones',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          
          // Campos informativos
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
                        SizedBox(
                          width: pantalla.width * .40,
                          child: const Text(
                            'Promociones Activas',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: pantalla.width * .40,
                          child: const Text(
                            'Promociones Sin Uso',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: pantalla.width * .40,
                          child: const Text(
                            'Promociones Recientes',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
