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
  //todo arreglar el feedback
  //todo darle un diseño mas bonito a todo agregar UX ala screen y los colores sombras a cada uno
  //todo agregar el icono hacia atras en el appbaner y darle animación que aparezca por primera vez cuando vena la screen
  //todo agregar el buscador ahi se mostraran las cartas

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;
    return Scaffold(
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
                  color: const Color.fromARGB(255, 172, 156, 218),
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
                      //Este es el feedback. Creo que tendre que hacer uno por cada uno :,vvvv
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
                                foregroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
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
                      //y las cartas de los productos
                      //TODO Checar como puedo generar los productos en dos filas en un montón de columnas
                      //TODO O si no cambiar a solo una carta que se genere en columnas

                      Container(
                        height: pantalla.height * .12,
                        width: pantalla.width,
                        //sdecoration: BoxDecoration(color: Colors.cyan),
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
                childCount: 1, // Ajusta según el número de elementos
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Sombra sutil
              spreadRadius: 2, // Extensión de la sombra
              blurRadius: 5, // Desenfoque de la sombra
              offset: Offset(0, 3), // Desplazamiento de la sombra
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Sombra secundaria
              spreadRadius: -5, // Extensión de la sombra
              blurRadius: 8, // Desenfoque de la sombra
              offset: Offset(-5, -5), // Desplazamiento de la sombra
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
                          width: double
                              .infinity, // Asegúrate de que ocupe todo el ancho
                          height: pantalla.height, // Tamaño uniforme
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(137, 38, 182, 170),
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
