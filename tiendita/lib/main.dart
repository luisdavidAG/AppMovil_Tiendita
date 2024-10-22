import 'package:flutter/material.dart';
import 'package:tiendita/screns/home_Screnn.dart';
import 'package:tiendita/screns/login_Screen.dart';
import 'package:tiendita/screns/tuInventario_Screnn.dart';
import 'package:tiendita/screns/tuListaSurtido_Screnn.dart';
import 'package:tiendita/screns/tuProductos_Screen.dart';
import 'package:tiendita/screns/tuPromociones__Screnn.dart';
import 'package:tiendita/widgets/TuListaSurtido/Tu_ListaSurtido.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //Temas para textos
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold)),

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Login,
    );
  }
}
