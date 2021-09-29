
import 'package:flutter/material.dart';
import 'package:movies/providers/movie_provider.dart';
import 'package:movies/widgets/widgets.dart';
import 'package:provider/provider.dart';
//Declaramos el stateless widget
class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    
    final  moviesProvider = Provider.of<MoviesProviders>(context);
    
    
    
    return Scaffold(
      //Propiedad appbar la cual nos mostrara el texto de la app o titulo
      appBar:AppBar(
        //Propiedad titulo, la cual sirve para colocar el titulo que queremos mostrar
        title: Text('Movies In Cinnemas'),
        //Propiedad para centrar el titulo
        centerTitle:true,
        //Sirve para colocar los iconos en el appbar así como leading.
        actions: [
          //Propiedad iconButton Nos sirve para colocar los iconos que queremos mostrar en el appbar
          IconButton(
            //Icono a mostrar
            icon:Icon( Icons.search_outlined),
            //Metodo onPressed nos ayuda a realizar una acción cuando presionan el icono
            onPressed: (){}), 
        ],
      ),
      //Widget para hacer scroll para bajar y subir de la aplicación 
      body: SingleChildScrollView(
        child:Column(
        children:[
          SizedBox(height:20),
          CardSwiper(movies:moviesProvider.OnDisplayMovies),
          //Carrusel de peliculas.
           SizedBox(height:20),
          MovieSlider(
            movies:moviesProvider.popularMovies,
            title:'Populares',
            onNextPage:()=> moviesProvider.getPopularMovies(),

           ),
          MovieSlider(
            movies:moviesProvider.popularMovies,
            title:'Destacadas',
            onNextPage:()=> moviesProvider.getPopularMovies(),

           ),


          ]
          
        ),
    
      )   
    
    );
    
  }
}