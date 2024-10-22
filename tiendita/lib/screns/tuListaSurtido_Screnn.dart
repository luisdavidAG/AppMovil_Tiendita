import 'package:flutter/material.dart';
import 'package:tiendita/widgets/Personalizados_Screnns/FeedBack_ListaSurtido.dart';

class TuListaSurtido_Screnn extends StatefulWidget {
  const TuListaSurtido_Screnn({super.key});

  @override
  State<TuListaSurtido_Screnn> createState() => __TuListaSurtido_ScrennState();
}

class __TuListaSurtido_ScrennState extends State<TuListaSurtido_Screnn> {
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
                    const FBListaSurtido(),
                    //Despues son los titulos
                    Container(
                      height: pantalla.height * .08,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Título de la sección 'Tus Productos'
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
                        ],
                      ),
                    ),
                    //y las cartas de los productos
                    //TODO Checar como puedo generar los productos en fos filas en un un monton de columnas 
                    //TODo O si no cambiar a solo una carta que se genere en columnas
                    const Row(
                      children: [
                        Text('Aqui van la mugre lista de surtido'),
                      ],
                    ),
                    Container(
                          height: pantalla.height*.70,
                          width: pantalla.width,
                          decoration: BoxDecoration(
                            color: Colors.grey
                          ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white70,
        onPressed: () {
          // Acción al presionar el botón
        },
        child: Icon(Icons.picture_as_pdf_rounded , color: Colors.lightGreen.shade900,), // Ícono dentro del botón
        tooltip: 'Añadir',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}