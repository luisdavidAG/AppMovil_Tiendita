import 'package:flutter/material.dart';

late Size pantalla;

class Carta_Promocion extends StatefulWidget {
  const Carta_Promocion({super.key});

  @override
  State<Carta_Promocion> createState() => _Carta_PromocionState();
}

class _Carta_PromocionState extends State<Carta_Promocion> {
  final double padings_H = 30;
  final double padings_V = 25;

  @override
  Widget build(BuildContext context) {
    pantalla = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: padings_V),
      child: Container(
        height: pantalla.height * .25, // Ajusta la altura del contenedor
        width: pantalla.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 58, 248, 0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Para la foto
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10), // Reducir el padding vertical
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 5),
                width: pantalla.width * .35, // Reducir un poco el ancho de la imagen
                height: pantalla.height * .20, // Ajustar la altura de la imagen
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // Para el texto
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal:4), // Reducir el padding vertical
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Promoción 1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 2.0),
                      child: Text(
                        'Descripción de lo que es eyto knvnkovsdknvskvkslnevkklnsevknlsevknlelknsve vensevlknsevnlkesknlekn mevsnklsvknlvse',
                        maxLines: 3, // Limita a 3 líneas de texto
                        overflow: TextOverflow.ellipsis, // Añade puntos suspensivos si es muy largo
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 5), // Añade espacio entre la descripción y los botones
                    // Contenedor para los botones
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            // Botón "No"
                            height: 30,
                            width: pantalla.width * .12,
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(10), // Añade borde redondeado
                            ),
                          ),
                          Container(
                            // Botón "Sí"
                            height: 30,
                            width: pantalla.width * .22,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 116, 95, 175),
                              borderRadius: BorderRadius.circular(10), // Añade borde redondeado
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
