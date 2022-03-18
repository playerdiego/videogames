import 'package:flutter/material.dart';
import 'package:videogames/models/game.dart';
import 'package:http/http.dart' as http;
import 'package:videogames/models/game_details_response.dart';
import 'package:videogames/models/games_response.dart';


class GamesProvider extends ChangeNotifier {

  final String _apiKey = 'e149480fa7204c30927274c5409af52d';
  final String _baseUrl = 'api.rawg.io';
  int _page = 0;

  List<Game> topGames = [];
  List<Game> popularGames = [];

  GamesProvider() {

    getTopGames();
    getPopularGames();

  }

  getTopGames() async {

    _page += 1;
    
    final Uri url = Uri.https(_baseUrl, '/api/games', {
      "key": _apiKey,
      "page": '$_page',
      "page_size": "10"
    });


    final response = await http.get(url);


    final GamesResponse gamesResponse = GamesResponse.fromJson(response.body);
    topGames = [...topGames, ...gamesResponse.results];
    notifyListeners();

  }

  getPopularGames() async {

    _page +=1;

    final Uri url = Uri.https(_baseUrl, '/api/games', {
      "key": _apiKey,
      "page": '$_page',
      "dates": "2021-01-01,2022-02-04",
      "ordering": "-added",
      "page_size": "10"
    });

    final response = await http.get(url);

    final GamesResponse gamesResponse = GamesResponse.fromJson(response.body);
    popularGames = [...popularGames, ...gamesResponse.results];
    notifyListeners();

  }

  Future<GameDetailsResponse> getGameDetails(int id) async {

    final Uri url = Uri.https(_baseUrl, '/api/games/$id', {
      "key": _apiKey,
    });

    final response = await http.get(url);

    final GameDetailsResponse gameDetailsResponse = GameDetailsResponse.fromJson(response.body);

    return gameDetailsResponse;

  }

}