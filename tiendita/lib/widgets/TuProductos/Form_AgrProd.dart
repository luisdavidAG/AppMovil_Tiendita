import 'package:flutter/material.dart';

class FormAgrprod extends StatefulWidget {

  final GlobalKey fomrKey;
  const FormAgrprod({super.key, required this.fomrKey});

  @override
  State<FormAgrprod> createState() => _FormAgrprodState();
}

class _FormAgrprodState extends State<FormAgrprod> {

  @override
  
  Widget build(BuildContext context) {

    return Container(
      key: widget.fomrKey,
      //backgroundColor: Colors.black87,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(colors: [
          Color(0xFF5C5DE9),
          Color(0xFF8A6DE9),
        ]),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                "Agrega Productos a \nTu Inventario",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              const SizedBox(height: 8),
              const Text(
                "Tus Clientes Necesitan Nuevos Productos !",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white60),
              ),
              const SizedBox(height: 8),
              const Text(
                "Agrega nuevos productos para que siempre estén disponibles en tu inventario. Completa los campos necesarios y selecciona 'Guardar' para añadirlos.",
                style: TextStyle( fontSize: 14, color: Colors.white60),
              ),
              const SizedBox(height: 20),

              // Text Fields
              _buildTextField(context, "Nombre"),
              const SizedBox(height: 15),
              _buildTextField(context, "Cantidad"),
              const SizedBox(height: 15),
              _buildTextField(context, "Categoria"),
              const SizedBox(height: 15),
              _buildTextField(context, "Etc"),
              const SizedBox(height: 30),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      //Borra los valores del los textield
                    },
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    //Aqui se hace todo ese pero de verificar el formulari
                    //Insert into Values //
                    onPressed: () {},
                    child: const Text(
                      "Gurdar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildTextField(BuildContext context, String hintText,) {

    return TextField(
      style: TextStyle(
        color: Colors.white70,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        hintText: hintText,
        hintStyle: TextStyle( color: Colors.white60),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    );
  }
}
