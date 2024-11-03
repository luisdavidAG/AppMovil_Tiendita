import 'package:flutter/material.dart';
import 'package:tiendita/screns/tuInventario_Screnn.dart';
import 'package:tiendita/widgets/Personalizados_Screnns/FeedBack_Productos.dart';
import 'package:tiendita/widgets/TuProductos/Form_AgrProd.dart';
import 'package:tiendita/widgets/TuProductos/Form_EditProd.dart';
import 'package:tiendita/widgets/TuProductos/Form_ElimProd.dart';

class TuProductos_Screnn extends StatefulWidget {
  final String initialCrud;
  final bool scrollToForm;

  const TuProductos_Screnn({
    super.key,
    required this.initialCrud,
    required this.scrollToForm,
  });

  @override
  State<TuProductos_Screnn> createState() => _TuProductos_ScrennState();
}

class _TuProductos_ScrennState extends State<TuProductos_Screnn> {
  final GlobalKey formKey = GlobalKey(); // Clave para el formulario
  final ScrollController _scrollController = ScrollController(); // Controlador de scroll

  // Padding constantes
  final double padings_H = 30;
  final double padings_V = 25;
  String? _selectedCrud;

  final List<Map<String, dynamic>> _crud = [
    {'name': 'Agregar Productos', 'icon': Icons.check_sharp, 'color': Colors.white},
    {'name': 'Eliminar Productos', 'icon': Icons.close_rounded, 'color': Colors.white},
    {'name': 'Editar Productos', 'icon': Icons.edit_rounded, 'color': Colors.white},
    {'name': 'Ver Inventario', 'icon': Icons.arrow_forward_rounded, 'color': Colors.white}
  ];

  // Método de desplazamiento
  void _scrollToForm() async{
    final RenderBox renderBox = formKey.currentContext?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero).dy + _scrollController.position.pixels-15;

     AsyncSnapshot.waiting(); _scrollController.animateTo(
      position - kToolbarHeight,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedCrud = widget.initialCrud;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.scrollToForm) {
        _scrollToForm();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: CustomScrollView(
          controller: _scrollController,
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
                                  expansionFraction < 0.5 ? 'Productos' : 'Hola Name',
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
                  padding: EdgeInsets.symmetric(horizontal: padings_H, vertical: padings_V),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Este es el feedback
                      if (index == 0) const FBProductos(),

                      // Título de la sección 'Productos'
                      if (index == 0)
                        Padding(
                          padding: EdgeInsets.only(top: padings_V),
                          child: Container(
                            height: pantalla.height * .08,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Productos',
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

                      // Combo box para seleccionar el CRUD y widgets adicionales
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF5C5DE9), Color(0xFF8A6DE9)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: _dropDown(
                          underline: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          dropdownColor: Colors.grey.shade800,
                          iconEnabledColor: Colors.white,
                          hintStyle: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Widgets de cada uno de los CRUD
                      if (_selectedCrud == 'Agregar Productos') FormAgrprod(fomrKey:formKey),
                      if (_selectedCrud == 'Eliminar Productos') const FormElimprod(),
                      if (_selectedCrud == 'Editar Productos') FormEditprod(formKey: formKey),

                      const SizedBox(height: 20),

                      // Contenedores de ejemplo
                      if (index == 1)
                        Container(
                          height: pantalla.height * .40,
                          width: pantalla.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 167, 133, 133),
                          ),
                        ),
                      const SizedBox(height: 20),
                      Container(
                        height: pantalla.height * .40,
                        width: pantalla.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 167, 133, 133),
                        ),
                      ),
                      const SizedBox(height: 25),
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

  // COMBOBOX
  Widget _dropDown({
    DecoratedBox? box,
    Widget? underline,
    Widget? icon,
    TextStyle? style,
    TextStyle? hintStyle,
    Color? dropdownColor,
    Color? iconEnabledColor,
    
  }) =>
      DropdownButton<String>(
        borderRadius: BorderRadius.circular(20),
        value: _selectedCrud,
        underline: underline,
        icon: icon,
        dropdownColor: dropdownColor,
        style: style,
        iconEnabledColor: iconEnabledColor,
        onChanged: (String? newValue) {
          setState(() {
            _selectedCrud = newValue;
            if (_selectedCrud == 'Ver Inventario') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TuInventario_Screen()),
              );
            }
          });
        },
        hint: Text("Mis productos", style: hintStyle),
        items: _crud.map((crud) {
          return DropdownMenuItem<String>(
            value: crud['name'],
            child: Row(
              children: [
                Icon(crud['icon'], color: crud['color']),
                const SizedBox(width: 5),
                Text(crud['name']),
              ],
            ),
          );
        }).toList(),
      );
}
