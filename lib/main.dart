import 'package:flutter/material.dart';
import 'screens/screens.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Propiedad para quitar la barra roja que dice debug
      debugShowCheckedModeBanner: false,
      //Titulo de la app
      title: 'Movies App',
      //Propiedad para indicar que pantalla se mostrara primero.
      initialRoute: 'home',
      //Propiedad para declarar las rutas.
      routes:{
        //Pagina home el cual accedemos a su metodo.
        'home' : ( _ ) => HomeScreen(),
        //Pagina details el cual accedemos a su metodo.
        'details': ( _ ) => DetailsScreen()
      },
      //Propiedad tema, la cual es para cambiar el tema de app
      theme:ThemeData.light().copyWith(
        appBarTheme:AppBarTheme(
          backgroundColor: Colors.indigo
        ),
      )
    );
  }
}