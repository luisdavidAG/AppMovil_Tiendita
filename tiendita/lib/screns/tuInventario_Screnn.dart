import 'package:flutter/material.dart';
import 'package:tiendita/widgets/Personalizados_Screnns/FeedBack_Inventario.dart';
import 'package:tiendita/widgets/TuInventario/Tu_Inventario.dart';

class TuInventario_Screen extends StatefulWidget {
  const TuInventario_Screen({super.key});

  @override
  _TuInventarioScreenState createState() => _TuInventarioScreenState();
}

class _TuInventarioScreenState extends State<TuInventario_Screen> {
  //Padings constantes
  final double padings_H = 30;
  final double padings_V = 25;

  //TODO GENERALES
  //DO arreglar el feedback
  //todo darle un diseño mas bonito a todo agregar UX ala screen y los colores sombras a cada uno
  //DO agregar el icono hacia atras en el appbaner
  //TOdo APPBANER darle animación que aparezca por primera vez cuando vena la screen
  //todo agregar el buscador ahi se mostraran las cartas y que retraga el appbaner

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
                        SizedBox(width: 40), // Espacio entre ícono y texto
                        Text(
                          expansionFraction < 0.5 ? 'Inventario' : 'Hola Name',
                          style: TextStyle(
                              color: expansionFraction < 0.5
                                  ? Colors.white
                                  : Colors.white,
                              fontSize: expansionFraction < 0.5 ? 24 : 26,
                              fontWeight: FontWeight.w900),
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
                            decoration: BoxDecoration(
                              color: const Color(0xFF5C5DE9),
                            ),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: padings_H,
                    vertical: padings_V,
                  ),
                  child: Column(
                    children: [
                      //Este es el feedback. Creo que tendre que hacer uno por cada uno :,vvvv
                      const FBInventario(),
                      //Despues son los titulos
                      //TODO Alienar los componentes del boton ver mas ala izquierda
                      Padding(
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
                                  fontFamily:
                                      AutofillHints.creditCardSecurityCode,
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 100),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  side: BorderSide.none,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
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
                                  mainAxisSize: MainAxisSize.min,
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

                      Container(
                        height: pantalla.height * .12,
                        width: pantalla.width,
                        child: SearchBar(),
                      ),
                      Container(
                        height: pantalla.height,
                        width: pantalla.width,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                      )
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
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  bool _isActive = false;
  final double padings_V = 25;
  //TODO decirle a chat pro que arregle el buscador
  // no me gusta que este no este centrado
  //cuando le de tap afuer del contenedor que se desactive
  //que no nada mas le de tap a el icono se active si no que cuando le de tap al buscador
  //cuando este activado qye el el Fb desaparesca
  //que me muestre opcione de la busqueda
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
                          height: pantalla.height,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w200,
                            ),
                            enableSuggestions: false,
                            onChanged: (value) => '',
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
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ),
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              _isActive = true;
                              //cscsc
                            });
                          },
                          icon: const Icon(
                            Icons.search,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
