import 'package:flutter/material.dart';
import 'package:tiendita/widgets/Personalizados_Screnns/FeedBack_ListaSurtido.dart';

class TuListaSurtido_Screen extends StatefulWidget {
  const TuListaSurtido_Screen({super.key});

  @override
  _TuListaSurtidoScreenState createState() => _TuListaSurtidoScreenState();
}

class _TuListaSurtidoScreenState extends State<TuListaSurtido_Screen> {
  //Padings constantes
  final double padings_H = 30;
  final double padings_V = 25;

  //TODO GENERALES
  //todo hacer cada uno de los forms para el CRud
  //todo arreglar el feeedback
  //todo darle un diseño mas bonito a todo agregar UX ala screen y los colores sombras a cada uno
  //todo agregar el icono hacia atras en el appbaner y darle aniomacion que aparesca por primera ver cuando vena la screen

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;

    return Scaffold(
      //appBar:
      //METER EL APP BAR QUE SE HACE ACA BIEN MANIACO XDDD
      //Cuerpo
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Icon(Icons.menu),
              expandedHeight: pantalla.height * .20,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.deepPurpleAccent,
                ),
                title: Text('Hola Name'),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: padings_H,
                    vertical: padings_V,
                  ),
                  child: Column(
                    children: [
                      //Este es el Feedback Creo que tendre que hacer uno por cada uno :,vvvv
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
                                fontFamily:
                                    AutofillHints.creditCardSecurityCode,
                                fontSize: 24,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //y las cartas de los productos
                      //TODO Checar como puedo generar los productos en dos filas en un montón de columnas
                      //TODO O si no cambiar a solo una carta que se genere en columnas
                      const Row(
                        children: [
                          Text('Aquí van la mugre lista de surtido'),
                        ],
                      ),
                      Container(
                        height: pantalla.height * .70,
                        width: pantalla.width,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                childCount: 1, // Ajusta según el número de elementos
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white70,
        onPressed: () {
          // Acción al presionar el botón
        },
        child: Icon(
          Icons.picture_as_pdf_rounded,
          color: Colors.lightGreen.shade900,
        ), // Ícono dentro del botón
        tooltip: 'Añadir',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
