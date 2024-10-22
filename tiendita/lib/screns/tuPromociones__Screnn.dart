import 'package:flutter/material.dart';
import 'package:tiendita/widgets/Personalizados_Screnns/FeedBack_Promociones.dart';
import 'package:tiendita/widgets/TuPromociones/Carta_Promocion.dart';

class TuPromociones_Screen extends StatefulWidget {
  const TuPromociones_Screen({super.key});

  @override
  State<TuPromociones_Screen> createState() => _TuPromociones_ScreenState();
}

class _TuPromociones_ScreenState extends State<TuPromociones_Screen> {
  //padings
  final double padings_H = 30;
  final double padings_V = 25;

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;
    return Scaffold(
      //appBar:
      //Cuerpo
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ),
          //aqui van lo que es interactivo
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: padings_H, vertical: padings_V),
                child: Column(
                  children: [
                    //Este es el feed back de promociones
                    //Este es el Feedback Creo que tendre que hacer uno por cada uno :,vvvv
                    const FBPromociones(),
                    //Despues son los titulos
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 25),
                      child: Container(
                        height: pantalla.height * .08,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Título de la sección 'Tus Productos'
                            const Text(
                              'Tus Promociones \nExistentes',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily:
                                    AutofillHints.creditCardSecurityCode,
                                fontSize: 24,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 100),
                            // Botón 'Más Vendidos'
                            OutlinedButton(
                              onPressed: () {
                                // Acción cuando se presiona el botón
                                // Mandar a la pantalla Tus Promociones
                              },
                              style: OutlinedButton.styleFrom(
                                primary: const Color.fromARGB(
                                    255, 0, 0, 0), // Color del texto
                                side: BorderSide.none, // Sin borde
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ), // Padding interno
                                textStyle: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily:
                                      AutofillHints.creditCardSecurityCode,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize
                                    .min, // Ajusta el ancho al contenido
                                children: [
                                  Text('Ver más'), // Texto del botón
                                  // Espacio entre texto e ícono
                                  Icon(
                                    Icons.arrow_drop_down, // Flecha hacia abajo
                                    color: Color.fromARGB(
                                        255, 0, 0, 0), // Color del ícono
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //y las cartas de las promociones
                    //TODO Checar lo de generar las promociones
                    /*  const Row(
                      children: [
                        Text('Aqui van las mugres promociones'),
                      ],
                    ),
                  */
                    Column(
                      children: [
                        Carta_Promocion(),
                        Carta_Promocion(),
                        Carta_Promocion(),
                        Carta_Promocion(),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
