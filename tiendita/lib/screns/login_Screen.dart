import 'dart:ui';
import 'package:flutter/material.dart';

class loginScrenn extends StatelessWidget {
  const loginScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: pantalla.width,
          decoration: const BoxDecoration(
              //se pude meter una decoracion aqui para poder hacer que se mueva
              //lo de atras
              //Todo Buscar una forma de mover el degradado Todo el Tiempo jajj
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 0, 0),
            Color.fromARGB(255, 0, 0, 0),
          ])),
          child: const Padding(
            padding: EdgeInsets.only(top: 80.0, left: 25),
            child: Text(
              'Hola \nReguistrate',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            //Decoraciones del Login
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0))),
            //estos son los contenedores para los logins
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextField(
                    //decoraciones del imput
                    decoration: InputDecoration(
                        //icono
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        label: Text(
                          'Correo Electronico',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.red,
                          ),
                        )),
                  ),

                  //TODO hacer que se vea la contraseña cambiar al icono                 
                  //imput dos
                  const TextField(
                    decoration: InputDecoration(
                        //icono
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        label: Text(
                          'Contraseña',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.red,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  //texto olvidaste tu constraseña
                  //TODO eliminar
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '¿Olvideste tu Contraseña?',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  //separacion
                  const SizedBox(
                    height: 20.0,
                  ),
                  //boton
                  Container(
                    height: 50,
                    width: pantalla.width * .40,
                    child: ElevatedButton(
                      onPressed: () {
                        // aquí van los cambios al hacer clic
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30.0), // Esquinas redondeadas
                        ),
                        padding:
                            const EdgeInsets.all(0), // Sin padding adicional
                      ).copyWith(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) =>
                                null), // Eliminando el color predeterminado
                      ),
                      child: Ink(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 184, 4, 4),
                              Color.fromARGB(255, 8, 8, 41),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Seción',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'No Tienes Cuenta?',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Reguistrate',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ], //hijos
    ));
  }
}
