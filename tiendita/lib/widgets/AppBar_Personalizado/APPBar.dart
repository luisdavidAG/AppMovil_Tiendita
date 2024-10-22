import 'package:flutter/material.dart';

class AppBarr extends StatelessWidget {
  const AppBarr({super.key});

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;
    String usuario ='';
    //Este es el APPBOR modificado
    //TODO UX hacer el appbar mas pequeño
    //que se haga mas pequeño cuando vaya hacia abajo
    return Container(
      width: pantalla.width,
      height: pantalla.height * 0.30,
      decoration: const BoxDecoration(
        //Color del contenedor de arriba
        color: Colors.brown,
      ),
      child: Row(
        children: [
          //Todo Poner el icono
          Container(
            height: pantalla.height,
            width: pantalla.width * .30,
            alignment: Alignment.center,
            child: const CircleAvatar(
              maxRadius: 50.0,
              backgroundColor: Colors.white,
            ),
          ),

          //Texto
          Container(
            alignment: Alignment.centerLeft,
            height: pantalla.height,
            width: pantalla.width * .50,
            padding: const EdgeInsets.only(left: 5, top: 30),
            child: Text(
              'Hola $usuario',
              style: const TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: AutofillHints.creditCardSecurityCode,
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}