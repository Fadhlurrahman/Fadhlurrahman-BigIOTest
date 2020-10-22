import 'dart:convert';

import 'package:http/http.dart' as http;

class Film {
  String title;
  String openingcrawl;
  String director;
  String produser;
  DateTime releasedate;
  List<dynamic> listcharacter;

  Film({this.title, this.openingcrawl, this.director, this.produser, this.releasedate, this.listcharacter});

  factory Film.createFilm(Map<String, dynamic> object) {
    return Film(
        title: object['title'],
        openingcrawl: object['opening_crawl'],
        director: object['director'],
        produser: object['producer'],
        releasedate: DateTime.parse(object['release_date']),
        listcharacter: object['characters']);
  }

  static Future<Film> getFilm(String title) async {
    String apiURL = "https://swapi.dev/api/films/?search=" + title;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    var film = (jsonObject as Map<String, dynamic>)['results'][0];

    return Film.createFilm(film);
  }

  static Future<List<Film>> getListFilm() async {
    String apiURL = "https://swapi.dev/api/films/";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listFilm = (jsonObject as Map<String, dynamic>)['results'];

    List<Film> films = [];
    for (int i = 0; i < listFilm.length; i++) {
      films.add(Film.createFilm(listFilm[i]));
    }

    return films;
  }
}
