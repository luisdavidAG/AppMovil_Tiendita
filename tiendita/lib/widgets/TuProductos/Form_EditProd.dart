import 'package:flutter/material.dart';
import 'package:tiendita/widgets/TuInventario/Tu_Inventario.dart';

class FormEditprod extends StatefulWidget {
  final GlobalKey formKey;
  const FormEditprod({super.key, required this.formKey});

  @override
  State<FormEditprod> createState() => _FormEditprodState();
}

class _FormEditprodState extends State<FormEditprod> {
  //Controldores de los campos del formulario
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.formKey,  // Asignación de la clave global para navegación
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
              const Text(
                "Editar Producto en Inventario",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Asegúrate de que los datos sean correctos antes de guardar.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white60,
                ),
              ),
              const SizedBox(height: 20),
              //implementar el buscador
              Container(
                height: pantalla.height*.12,
                width: pantalla.width,
                decoration: BoxDecoration(
                  color: Colors.amberAccent
                ),
              ),

              // Campos de texto para edición
              _buildTextField(context, "Nombre", nameController),
              const SizedBox(height: 15),
              _buildTextField(context, "Cantidad", quantityController),
              const SizedBox(height: 15),
              _buildTextField(context, "Categoría", categoryController),
              const SizedBox(height: 15),
              _buildTextField(context, "Precio", priceController),
              const SizedBox(height: 30),

              // Botones
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
                      nameController.clear();
                      quantityController.clear();
                      categoryController.clear();
                      priceController.clear();
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
                    onPressed: () {
                      // Implementa aquí la lógica para guardar los cambios
                    },
                    child: const Text(
                      "Guardar",
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

  Widget _buildTextField(BuildContext context, String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white70, fontSize: 16),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white60),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    );
  }
}
