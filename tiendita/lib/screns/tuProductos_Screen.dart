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

  String? _selectedFruit;
  String? _selectedCrud;
  final List<Map<String,dynamic>> _fruits = [
    {'name': 'Agregar Productos', 'icon': Icons.check_sharp,'color':Colors.white},
    {'name': 'Eliminar Productos', 'icon': Icons.close_rounded,'color':Colors.white},
    {'name' : 'Editar Productos', 'icon': Icons.edit_rounded,'color':Colors.white},
    {'name' : 'Ver Invetario', 'icon': Icons.arrow_forward_rounded,'color':Colors.white}
  ];

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 189, 181, 204),
        body: CustomScrollView(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Si pusiera otra Seccion" Tendri que agregar el otro if con lo qu
                      // se agregaria o la seccion
                      // Este es el feed back
                      if (index == 0) const FBProductos(),
                      // Título de la sección 'Tus Productos'
                      if (index == 0)
                        Container(
                          height: pantalla.height * .08,
                          alignment: Alignment.centerLeft,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Productos',
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
                      // Aquí iría el CRUD Combo box y los widgets adicionales
                      //TODO hacer que funcione el combo box
                      //TODO Hacer que cambie el widget segun el que selecciona
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: _dropDown(
                            underline: Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(80.0)),),
                            style: const TextStyle(color: Colors.white),
                            dropdownColor: Colors.red,
                            iconEnabledColor: Colors.white,
                            hintStyle: const TextStyle(color: Colors.white),
                          )),

                      SizedBox(height: 20),

                      //TODO wiget para cada uno de los crud para evitar hacer carta para cada uno
                      //Con esto arreglaria lo de poner el Widget que necesito segun el mismisimo  combobox
                      //HAcer una lista en la parte de arriba
                      //de cada uno de los widgets personalizados para hacer el crud
                      if (index == 0)
                        Container(), //aqui se sustituyo por el wiget
                      Container(
                        height: pantalla.height * .80,
                        width: pantalla.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 167, 133, 133),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: pantalla.height * .40,
                        width: pantalla.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 167, 133, 133),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: pantalla.height * .40,
                        width: pantalla.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 167, 133, 133),
                        ),
                      ),
                      SizedBox(
                        height: 25,
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

  //COMBOBOX
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
          value: _selectedFruit,
          underline: underline,
          icon: icon,
          dropdownColor: dropdownColor,
          style: style,
          iconEnabledColor: iconEnabledColor,
          onChanged: (String? newValue) {
            setState(() {
              _selectedFruit = newValue;
              _selectedCrud = newValue;
              //tambien que cambie el contenedor cando se cambie xd
            });
          },
          hint: Text("Mis productos", style: hintStyle),
          items: _fruits.map((fruit) {
          return DropdownMenuItem<String>(
            value: fruit['name'],
            child: Row(
              children: [
                Icon(fruit['icon'],color: fruit['color']),
                SizedBox(width: 5),
                Text(fruit['name']),
              ],
            ),
          );
        }).toList(),
      );
}

//Combobox despleglabe
