import 'package:flutter/material.dart';
import 'package:tiendita/widgets/Personalizados_Screnns/FeedBack_Productos.dart';

class TuProductos_Screnn extends StatefulWidget {
  const TuProductos_Screnn({super.key});

  @override
  State<TuProductos_Screnn> createState() => _TuProductos_ScrennState();
}

class _TuProductos_ScrennState extends State<TuProductos_Screnn> {
  //Padings constantes
  final double padings_H = 30;
  final double padings_V = 25;
  
  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 189, 181, 204),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(Icons.menu),
            //title: Text('Hola Name'),
            expandedHeight: pantalla.height*.20,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.deepPurpleAccent,
              ),
              title: Text('Hola Name'),
            ),
          ),
          SliverToBoxAdapter(
            // child: SafeArea(
              child: Column(
                children: [
                  // Contenedor de fondo
                  Container(
                    height: pantalla.height * 0.90, // Ajuste de altura
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: padings_H, 
                        vertical: padings_V,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Este es el feed back
                          const FBProductos(),
                          
                          // Título de la sección 'Tus Productos'
                          Container(
                            height: pantalla.height * .08,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Productos',
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
                          // Aquí iría el CRUD
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Aquí va el widget del CRUD'),
                                Container(
                                  height: pantalla.height *.90,
                                  width: pantalla.width,
                                  decoration: BoxDecoration(color: Colors.grey),
                                ),
                                Container(
                                  height: pantalla.height *.90,
                                  width: pantalla.width,
                                  decoration: BoxDecoration(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
             // ),
            ),
          ),
        ],
      ),
    );
  }
}
