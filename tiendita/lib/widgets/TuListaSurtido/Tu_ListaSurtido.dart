import 'package:flutter/material.dart';
import 'package:tiendita/widgets/TuInventario/Tu_Inventario.dart';

class TuListaSurtido extends StatefulWidget {
  const TuListaSurtido({super.key});

  @override
  State<TuListaSurtido> createState() => __TuListaSurtidoStateState();
}

class __TuListaSurtidoStateState extends State<TuListaSurtido> {
  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
      child: Container(
        width: pantalla.width,
        height: pantalla.height *.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: Colors.blue),
        child: Column(
          children: [
            //Esta es la promocion 1
            //TODO Hacer un ListViewBuilder donde se manden llamar solo las primeras
            //TODO 3 Promociones
            listaSurtido() //promociones()
          ],
        ),
      ),
    );
  }
}

//Metodo para que cada se vaya haciendo una fila por fila
Widget listaSurtido (){
   return 
   Container(
      margin: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
     child: const Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text('Producto' ,style: TextStyle( fontSize: 15),),
         Divider(),
         Text('Categoria' ,style: TextStyle( fontSize: 15),),
         Text('Existentes' ,style: TextStyle( fontSize: 15),),
       ],
     ),
   );
}