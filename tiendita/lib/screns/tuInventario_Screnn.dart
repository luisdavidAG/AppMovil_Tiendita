import 'package:flutter/material.dart';
import 'package:tiendita/widgets/Buscador.dart';
import 'package:tiendita/widgets/Personalizados_Screnns/FeedBack_Inventario.dart';

class TuInventario_Screen extends StatefulWidget {
  const TuInventario_Screen({super.key});

  @override
  _TuInventarioScreenState createState() => _TuInventarioScreenState();
}

class _TuInventarioScreenState extends State<TuInventario_Screen> {
  // Padding constantes
  final double padings_H = 30;
  final double padings_V = 25;
  // Controlador y la llave del título
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _searchKey = GlobalKey();
  // la poderosa búsqueda
  String busquedaInv = '';

  // Calcula la posición del `SearchBar` y hace scroll hasta allí
  void _scrollToSearchBar() {
    final RenderBox renderBox = _searchKey.currentContext?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero).dy + _scrollController.position.pixels;

    _scrollController.animateTo(
      position - kToolbarHeight, // Ajuste para compensar la altura del AppBar
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: const Color(0xFF5C5DE9),
              expandedHeight: pantalla.height * 0.2,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double expansionFraction =
                      (constraints.maxHeight - kToolbarHeight) / (pantalla.height * 0.2 - kToolbarHeight);
                  return FlexibleSpaceBar(
                    title: Row(
                      children: [
                        SizedBox(width: 40),
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0.0, end: 1.0),
                          duration: Duration(milliseconds: 800),
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value,
                              child: Transform.translate(
                                offset: Offset(0, 0),
                                child: Text(
                                  expansionFraction < 0.5 ? 'Inventario' : 'Hola Name',
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
                    background: Stack(
                      children: [
                        Opacity(
                          opacity: expansionFraction > 0.5 ? 1 : 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF5C5DE9),
                                  Color(0xFF8A6DE9),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: expansionFraction <= 0.5 ? 1 : 0,
                          child: Container(
                            color: const Color(0xFF5C5DE9),
                          ),
                        ),
                      ],
                    ),
                    centerTitle: true,
                    titlePadding: EdgeInsets.only(left: 8, bottom: 10),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: padings_H, vertical: padings_V),
                  child: Column(
                    children: [
                      const FBInventario(),
                      Padding(
                        key: _searchKey,
                        padding: EdgeInsets.symmetric(vertical: padings_V),
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
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                                  side: BorderSide.none,
                                  textStyle: const TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: AutofillHints.creditCardSecurityCode,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Ver más'),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: pantalla.height * .12,
                        width: pantalla.width,
                        child: Buscador(
                          onTap: _scrollToSearchBar,
                          onBusquedaChanged: (String value) {
                            setState(() {
                              busquedaInv = value;
                            });
                            //ahora lo que busqueda es el select *from y de ahi hago mis cartas
                            //puta madreeeee
                            print("Texto de búsqueda: $busquedaInv");
                          },
                        ),
                      ),
                      Column(
                        children: List.generate(8, (index) {
                          return Text('Uno');
                        }),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


