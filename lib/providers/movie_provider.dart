
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/movie.dart';
import 'package:movies/models/now_playing_response.dart';
import 'package:movies/models/popular_response.dart';


class MoviesProviders extends ChangeNotifier{
  String _baseURL  = 'api.themoviedb.org';
  String _apiKey   = '9d4afff7ef6c84a17e9615ab5306b0a1';
  String _language = 'es-ES';

  // ignore: non_constant_identifier_names
  List<Movie> OnDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;


  MoviesProviders(){
    this.getOnDisplayMovies();
    this.getPopularMovies();
    }
    Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseURL, endpoint, {
     'api_key'  :_apiKey,
     'language' :_language,
     'page'     :'$page',
     
     });
      // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);  
    return response.body;
  }
  getOnDisplayMovies() async {
      final jsonData = await this._getJsonData('3/movie/now_playing');
      final nowResponse = NowPlayingResponse.fromJson(jsonData);
      
      OnDisplayMovies = nowResponse.results;
      
      notifyListeners();
  }

  getPopularMovies() async {
      _popularPage ++;
      final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
      final popularResponse = PopularResponse.fromJson(jsonData);
      
      popularMovies = [ ... popularMovies, ... popularResponse.results];
 
      notifyListeners();
  }

}

