import 'package:flutter/material.dart';
import 'package:tiendita/widgets/Personalizados_Screnns/FeedBack_Promociones.dart';
import 'package:tiendita/widgets/TuPromociones/Carta_Promocion.dart';

class TuPromociones_Screen extends StatefulWidget {
  const TuPromociones_Screen({super.key});

  @override
  State<TuPromociones_Screen> createState() => _TuPromociones_ScreenState();
}

class _TuPromociones_ScreenState extends State<TuPromociones_Screen> {
  // Padding
  final double padings_H = 30;
  final double padings_V = 25;

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
                  double expansionFraction = (constraints.maxHeight - kToolbarHeight) /
                      (pantalla.height * 0.2 - kToolbarHeight);
                  return FlexibleSpaceBar(
                    background: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF5C5DE9), Color(0xFF8A6DE9)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
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
                                  expansionFraction < 0.5 ? 'Promociones' : 'Hola Name',
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: padings_H,
                    vertical: padings_V,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Feedback para promociones
                      const FBPromociones(),

                      // Título de la sección 'Tus Promociones'
                      Padding(
                        padding: EdgeInsets.only(top: padings_V),
                        child: Container(
                          height: pantalla.height * .08,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Tus Promociones \nExistentes',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: AutofillHints.creditCardSecurityCode,
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  // Acción cuando se presiona el botón
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                                  side: BorderSide.none,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  textStyle: const TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: AutofillHints.creditCardSecurityCode,
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
                      
                      // Cartas de promociones
                      Column(
                        children: [
                          Carta_Promocion(),
                          Carta_Promocion(),
                          Carta_Promocion(),
                          Carta_Promocion(),
                        ],
                      ),
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

