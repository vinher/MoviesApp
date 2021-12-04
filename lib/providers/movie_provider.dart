
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movies/helpers/debouncer.dart';
import 'package:movies/models/credits_response.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/models/now_playing_response.dart';
import 'package:movies/models/popular_response.dart';
import 'package:movies/models/search_movies.dart';


class MoviesProviders extends ChangeNotifier{
  String _baseURL  = 'api.themoviedb.org';
  String _apiKey   = '9d4afff7ef6c84a17e9615ab5306b0a1';
  String _language = 'es-ES';

  // ignore: non_constant_identifier_names
  List<Movie> OnDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  final debouncer = Debouncer(
     duration:Duration(milliseconds:500),
    );
  Map<int, List<Cast>> moviesCast ={};


  final StreamController<List<Movie>> _suggestionStreamController = StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream =>this._suggestionStreamController.stream;

  MoviesProviders(){
    this.getOnDisplayMovies();
    this.getPopularMovies();

    }
    Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseURL, endpoint, {
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
  Future <List<Cast>> getMovieCast(int movieId)async{
    if(moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query ) async{
    final url = Uri.https(_baseURL, '3/search/movie', {
     'api_key'  :_apiKey,
     'language' :_language,
      'query'   :query     
     });
    final response = await http.get(url);  
    final searchResponse = SearchResponse.fromJson(response.body);
  
    return searchResponse.results;
  }

  void getSuggestionsByQuery(String searchTerm){
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await this.searchMovies(value);
      this._suggestionStreamController.add(results);      
    };
    final timer = Timer.periodic(Duration(milliseconds:300), (_) {
      debouncer.value = searchTerm;
     });

  Future.delayed(Duration(milliseconds: 301)).then((_)=>timer.cancel());

  }

}

