import 'package:flutter/material.dart';
import 'package:tiendita/widgets/TuInventario/Tu_Inventario.dart';

class TuPromociones extends StatefulWidget {
  const TuPromociones({super.key});

  @override
  State<TuPromociones> createState() => _TuPromocionesState();
}

class _TuPromocionesState extends State<TuPromociones> {
  @override
  Widget build(BuildContext context) {
    return 
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: pantalla.width,
        height: pantalla.height *.50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: Colors.blue),
        child: Column(
          children: [
            //Esta es la promocion 1
            //TODO Hacer un ListViewBuilder donde se manden llamar solo las primeras
            //TODO 3 Promociones
            promociones(),
            promociones(), 
            promociones(), 
            promociones(),  //promociones()
          ],
        ),
      ),
    );
    
  }
}

//Se manda llamar el nombre, la cantidad y un precio X

//TODO VER EL VIDEO DEL LIST VIEW BUILDER
//cuando hay mas de una promocion
//por medio de un metodo en un ciclo for que vea las promociones
//y mande al list view builder. todas las promociones

//Si no manda llamar ninguna promocion que nada mas mande un widget
//que diga que no hay nada de promociones
Widget promociones() {
  return Expanded(
      child: Row(
        //aqui se generernan los widgets con las promociones
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: pantalla.height*.20,
            width: pantalla.width*.45,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 8, 35, 39),
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),topLeft: Radius.circular(20)),
              ),
          ),
          const Padding(
            padding: EdgeInsets.only(left:10),
            child: Column(
              children: [
                Text(
                  'Nombre',
                  style: TextStyle(),
                ),
                Text(
                  'Descripion',
                  style: TextStyle(),
                )
              ],
            ),
          ),
        ],
      ),
  );
}