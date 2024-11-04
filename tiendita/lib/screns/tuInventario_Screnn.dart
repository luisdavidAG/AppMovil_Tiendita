import 'package:flutter/material.dart';
import 'package:tiendita/widgets/Personalizados_Screnns/FeedBack_Inventario.dart';

class TuInventario_Screen extends StatefulWidget {
  const TuInventario_Screen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TuInventarioScreenState createState() => _TuInventarioScreenState();
}

class _TuInventarioScreenState extends State<TuInventario_Screen> {
  //Padings constantes
  final double padings_H = 30;
  final double padings_V = 25;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _searchKey = GlobalKey();

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
      //backgroundColor: const Color(0xFF5C5DE9),
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
                      (constraints.maxHeight - kToolbarHeight) /
                          (pantalla.height * 0.2 - kToolbarHeight);
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
                                  expansionFraction < 0.5
                                      ? 'Inventario'
                                      : 'Hola Name',
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

            //Lista
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: padings_H,
                    vertical: padings_V,
                  ),
                  child: Column(
                    children: [
                      //Este es el feedback. Creo que tendre que hacer uno por cada uno :,vvvv
                      const FBInventario(),
                      //Despues son los titulos
                      Padding(
                        key: _searchKey, // Asigna el GlobalKey al contenedor del título
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
                                //Cuando se toque que va hacer
                                onPressed: () {},
                                //Estilo
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
                      //y las cartas de los productos
                      //TODO Checar como puedo generar los productos en dos filas en un montón de columnas
                      //TODO O si no cambiar a solo una carta que se genere en columnas
                      SizedBox(
                        height: pantalla.height * .12,
                        width: pantalla.width,
                        child: SearchBar(onTap: _scrollToSearchBar),
                      ),
                      // Generación de las cartas
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

//buscador
class SearchBar extends StatefulWidget {
  final VoidCallback onTap;

  const SearchBar({Key? key, required this.onTap}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with SingleTickerProviderStateMixin {
  bool _isActive = false;
  final double padings_V = 25;
  final FocusNode _focusNode = FocusNode();

  final String busqueda = '';

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padings_V),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: -5,
              blurRadius: 8,
              offset: Offset(-5, -5),
            ),
          ],
        ),
        child: TextButton(
          onPressed: () {
            widget.onTap();
            setState(() {
              _isActive = true;
              _focusNode.requestFocus();
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (!_isActive)
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Busca un producto",
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 125),
                    child: _isActive
                        ? Container(
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Focus(
                              onFocusChange: (hasFocus) {
                                if (!hasFocus) {
                                  setState(() {
                                    _isActive = false;
                                  });
                                }
                              },
                              child: TextField(
                                focusNode: _focusNode,
                                onTap: () {
                                  setState(() {
                                    _isActive = true;
                                  });
                                },
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200,
                                ),
                                enableSuggestions: false,
                                onChanged: (value) => busqueda,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'Busca algun producto',
                                  focusColor: const Color.fromARGB(255, 0, 0, 0),
                                  prefixIcon: const Icon(Icons.search),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isActive = false;
                                      });
                                      _focusNode.unfocus();
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                widget.onTap();
                                _isActive = true;
                                _focusNode.requestFocus();
                              });
                            },
                            icon: const Icon(Icons.search),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}