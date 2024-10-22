import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final double expandedHeight;

  const CustomAppBar({Key? key, required this.expandedHeight}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;
    String usuario = 'Negro';
    double fontSize = widget.expandedHeight /4;

    return Container(
      width: pantalla.width,
      height: widget.expandedHeight,
      decoration: const BoxDecoration(
        color: Colors.brown,
      ),
      child: Row(
        children: [
          Container(
            height: widget.expandedHeight,
            width: pantalla.width * .30,
            alignment: Alignment.center,
            child: const CircleAvatar(
              maxRadius: 50.0,
              backgroundColor: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            height: widget.expandedHeight,
            width: pantalla.width * .50,
            padding: const EdgeInsets.only(left: 5, top: 30),
            child: Text(
              'Hola $usuario',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: AutofillHints.creditCardSecurityCode,
                fontSize: fontSize, // Usamos la variable fontSize calculada
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
