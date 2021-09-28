
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/movie.dart';
import 'package:movies/models/now_playing_response.dart';


class MoviesProviders extends ChangeNotifier{
  String _baseURL  = 'api.themoviedb.org';
  String _apiKey   = '9d4afff7ef6c84a17e9615ab5306b0a1';
  String _language = 'es-ES';

  List<Movie> OnDisplayMovies = [];


  MoviesProviders(){
    this.getOnDisplayMovies();
  }
  getOnDisplayMovies() async {
   var url = Uri.https(_baseURL, '3/movie/now_playing', {
     'api_key'  :_apiKey,
     'language' :_language,
     'page'     :'1',
     
     });
      // Await the http get response, then decode the json-formatted response.
      final response = await http.get(url);
      final nowResponse = NowPlayingResponse.fromJson(response.body);
       OnDisplayMovies = nowResponse.results;
      notifyListeners();
  }
}