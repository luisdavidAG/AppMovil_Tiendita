import 'package:flutter/material.dart';
import 'package:tiendita/widgets/Personalizados_Screnns/FeedBack_ListaSurtido.dart';

class TuListaSurtidoScreen extends StatefulWidget {
  const TuListaSurtidoScreen({super.key});

  @override
  _TuListaSurtidoScreenState createState() => _TuListaSurtidoScreenState();
}

class _TuListaSurtidoScreenState extends State<TuListaSurtidoScreen> {
  // Padding
  final double paddingHorizontal = 30;
  final double paddingVertical = 25;

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // SliverAppBar con gradiente y animación de título
            SliverAppBar(
              backgroundColor: Colors.deepPurpleAccent,
              expandedHeight: pantalla.height * 0.2,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double expansionFraction = (constraints.maxHeight - kToolbarHeight) /
                      (pantalla.height * 0.2 - kToolbarHeight);
                  return FlexibleSpaceBar(
                    background: Container(
                      color: Colors.deepPurpleAccent,
                    ),
                    title: Row(
                      children: [
                        const SizedBox(width: 40),
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 800),
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value,
                              child: Transform.translate(
                                offset: Offset(0, 0),
                                child: Text(
                                  expansionFraction < 0.5 ? 'Lista de Surtido' : 'Hola Name',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: expansionFraction < 0.5 ? 24 : 26,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    centerTitle: true,
                    titlePadding: EdgeInsets.only(left: 8, bottom: 10),
                  );
                },
              ),
            ),
            // SliverList para mostrar el contenido
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: paddingHorizontal,
                    vertical: paddingVertical,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Feedback para la lista de surtido
                      const FBListaSurtido(),

                      // Título de la sección "Lista de Surtido"
                      Padding(
                        padding: EdgeInsets.only(top: paddingVertical),
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
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  // Acción para el botón "Ver más"
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                                  side: BorderSide.none,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  textStyle: const TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Ver más'),
                                    Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Contenedor para mostrar la lista de surtido
                      Container(
                        height: pantalla.height * .6,
                        width: pantalla.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: listaSurtido(), // Widget que muestra los elementos del surtido
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

// ListView para mostrar filas de productos
Widget listaSurtido() {
  return ListView.builder(
    itemCount: 5, // Número de productos en la lista (ajustar según sea necesario)
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Producto', style: TextStyle(fontSize: 15)),
            Text('Categoria', style: TextStyle(fontSize: 15)),
            Text('Existentes', style: TextStyle(fontSize: 15)),
          ],
        ),
      );
    },
  );
}
