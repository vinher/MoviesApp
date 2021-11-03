import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate{
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar Película';


  @override
  List<Widget>? buildActions(BuildContext context) {
      return [
        IconButton(
          icon:Icon(Icons.clear),
          onPressed:(){
            query = '';
          }
        ),
        
        ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon:Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Results');
  }

  Widget _EmpyContainer(){
    return Container(
      child: Center(
        child:Icon(Icons.movie_creation_outlined,color:Colors.black38,size:130,),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return _EmpyContainer();
    }
    final moviesProvider  = Provider.of<MoviesProviders>(context, listen:false);

    return FutureBuilder(
      future:moviesProvider.searchMovies(query),
      builder:(  _ , AsyncSnapshot <List<Movie>>  snapshot) {
      if (!snapshot.hasData) return _EmpyContainer();
      
      final movies = snapshot.data!;
      return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (_,int index)=>_MovieItem(movies[index])
        );
      }
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem(this.movie); 
  
  @override
  Widget build(BuildContext context) {
    
    movie.heroId = 'search-${movie.id}';
    
    return ListTile(
      leading:Hero(
        tag: movie.heroId!,
        child: FadeInImage(
        placeholder:AssetImage('assets/no-image.jpg'),
        image:NetworkImage(movie.fullPosterImg),
        width: 50,
        fit:BoxFit.contain
        ),
      ),
      title:Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap:(){
        Navigator.pushNamed(context, 'details',arguments:movie);
      },      
    );
  }
}
