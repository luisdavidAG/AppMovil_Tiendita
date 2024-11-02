import 'package:flutter/material.dart';
import 'package:tiendita/screns/tuInventario_Screnn.dart';
import 'package:tiendita/screns/tuListaSurtido_Screnn.dart';
import 'package:tiendita/screns/tuProductos_Screen.dart';
import 'package:tiendita/screns/tuPromociones__Screnn.dart';
import 'package:tiendita/widgets/AppBar_Personalizado/APPBar.dart';
import 'package:tiendita/widgets/TuInventario/Tu_Inventario.dart';
import 'package:tiendita/widgets/TuListaSurtido/Tu_ListaSurtido.dart';
import 'package:tiendita/widgets/TuProductos/CardAgrProd.dart';
import 'package:tiendita/widgets/TuProductos/CardConsProd.dart';
import 'package:tiendita/widgets/TuProductos/CardEditProd.dart';
import 'package:tiendita/widgets/TuProductos/CardElimProd.dart';
import 'package:tiendita/widgets/TuPromociones/Tu_Promociones.dart';
//import 'package:tiendita/widgets/TuProductos/Tus_Productos.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final String usuario = '';

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;
    //Meter los padings globales

    return Scaffold(
      //meter un color de fondo que se vea solido pero agradable ala vista

      appBar: const PreferredSize(
        preferredSize:
            Size.fromHeight(150.0), // Ajusta la altura según tu diseño
        child: AppBarr(),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // Tu inventario
            //TODO Arreglar el diseño del contenedor que se vea perrisimo
            //Sombras
            //Imagen y demas
            //Checar que puedo meter ahi
            Container(
              height: pantalla.height * .30,
              width: pantalla.width,
              child: Column(
                children: [
                  // Titulo
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                      height: pantalla.height * .08,
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Tu inventario',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: AutofillHints.creditCardSecurityCode,
                          fontSize: 24,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Widget de tus productos reguistrados
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TuInventario_Screen()),
                            );
                          },
                          child:
                              const TuInventario())) // Mueve esto fuera del Container
                ],
              ),
            ),
            SizedBox(height: 30),

            // Tus productos
            Container(
              height: pantalla.height * .65, // Puedes ajustar esto
              width: pantalla.width,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 255, 122, 122)),

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                      height: pantalla.height * .08,
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Tus Productos',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: AutofillHints.creditCardSecurityCode,
                          fontSize: 24,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  //Carta 1  y Carta 2
                  Row(
                    children: [
                      Container(
                          height: pantalla.height * .25,
                          width: pantalla.width * .50,
                          // decoration: BoxDecoration(color: Colors.black87),
                          //carta_1Productos
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TuProductos_Screnn()),
                              );
                            },
                            child: const TusProductos(),
                          )),
                      Container(
                          height: pantalla.height * .25,
                          width: pantalla.width * .50,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(149, 16, 212, 32)),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TuProductos_Screnn()),
                              );
                            },
                            child: const TusProductos(),
                          ))
                    ],
                  ),
                  // SizedBox( height: 20),
                  //Carta 3 y Carta 4
                  //Cartas 3 y 4 Expandidas hast el tope
                  //lo que tiene el pading son los widgetes de cada uno ajajaj
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                            height: pantalla.height * .25,
                            width: pantalla.width * .50,
                            // decoration: BoxDecoration(color: Colors.black87),
                            //carta_1Productos
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TuProductos_Screnn()),
                                );
                              },
                              child: const TusProductos(),
                            )),
                        Container(
                            height: pantalla.height * .25,
                            width: pantalla.width * .50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(149, 16, 212, 32)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TuProductos_Screnn()),
                                );
                              },
                              child: const TusProductos(),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),

            //Esta es Tus Promociones
            //TODO se ve a expandir alas prociones que haya
            //TODO si hay 1 mostrar una SINO monstrar que no hay promociones aun
            Container(
              height: pantalla.height * .65, // Puedes ajustar esto
              width: pantalla.width,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 87, 119, 141)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: pantalla.height * .08,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                          //Boton de ver mas lo tengo que hacer como un widget
                          //TODO hacer el Boton un widget para volverlo a llamas despues
                          OutlinedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                              //Mandar ala Screen Tus Promociones
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TuPromociones_Screen()),
                              );
                            },
                            child: Text('Ver mas'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor:
                                  const Color.fromARGB(255, 0, 0, 0),
                              side: BorderSide.none, // Borde
                              //pading interno
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              textStyle: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily:
                                    AutofillHints.creditCardSecurityCode,
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TuPromociones_Screen()),
                      );
                    },
                    child: const TuPromociones(),
                  )
                ],
              ),
            ),

            //Lista de Surtido
            //Lo que manda llamar aqui es el widget personalizado de lo LISTA DE SURTIDO
            Container(
              width: pantalla.width,
              height: pantalla.height * .40,
              decoration: BoxDecoration(color: Colors.lightGreenAccent),
              child: Column(
                children: [
                  //Titutlo y Boton
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: pantalla.height * .08,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Lista De Surtido',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: AutofillHints.creditCardSecurityCode,
                              fontSize: 24,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //Boton de ver mas lo tengo que hacer como un widget
                          //TODO hacer el Boton un widget para volverlo a llamas despues
                          OutlinedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                              //Mandar ala Screen Tus Promociones
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TuListaSurtido_Screen()),
                              );
                            },
                            child: Text('Ver mas'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor:
                                  const Color.fromARGB(255, 0, 0, 0),
                              side: BorderSide.none, // Borde
                              //pading interno
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              textStyle: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily:
                                    AutofillHints.creditCardSecurityCode,
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //Contenedor expandido
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TuListaSurtido_Screen()),
                      );
                    },
                    child: const TuListaSurtido(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
