import 'package:flutter/material.dart';
import 'package:tiendita/widgets/Personalizados_Screnns/FeedBack_Inventario.dart';

class TuInventario_Screen extends StatefulWidget {
  const TuInventario_Screen({super.key});

  @override
  State<TuInventario_Screen> createState() => _TuInventario_ScreenState();
}

class _TuInventario_ScreenState extends State<TuInventario_Screen> {
  //Padings constantes
  final double padings_H = 30;
  final double padings_V = 25;
  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;
    return Scaffold(
      //appBar:
      //METER EL APP BAR QUE SE HACE ACA BIEN MANIACO XDDD

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
              //Este es el Feedback Creo que tendre que hacer uno por cada uno :,vvvv
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: padings_H, vertical: padings_V),
                child: Column(
                  children: [
                    //Este es el feed back
                    const FBInventario(),
                    //Despues son los titulos
                    Container(
                      height: pantalla.height * .08,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Título de la sección 'Tus Productos'
                          const Text(
                            'Tus Productos',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: AutofillHints.creditCardSecurityCode,
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
                              foregroundColor: const Color.fromARGB(
                                  255, 0, 0, 0), side: BorderSide.none, // Sin borde
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
                    //y las cartas de los productos
                    //TODO Checar como puedo generar los productos en fos filas en un un monton de columnas 
                    //TODo O si no cambiar a solo una carta que se genere en columnas
                    const Row(
                      children: [
                        Text('Aqui van las mugres cartas'),
                      ],
                    ),
                    Container(
                          height: pantalla.height*.80,
                          width: pantalla.width,
                          decoration: BoxDecoration(
                            color: Colors.grey
                          ),
                    )
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