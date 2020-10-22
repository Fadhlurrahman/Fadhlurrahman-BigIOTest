import 'dart:convert';

import 'package:http/http.dart' as http;

class Planet {
  String name;
  String diameter;
  String rotationPeriod;
  String orbitalPeriod;
  String gravity;
  String population;
  String climate;
  String terrain;
  String surfaceWater;
  List<dynamic> residents;

  Planet(
      {this.name,
      this.diameter,
      this.rotationPeriod,
      this.orbitalPeriod,
      this.gravity,
      this.population,
      this.climate,
      this.terrain,
      this.surfaceWater,
      this.residents});

  factory Planet.createPlanet(Map<String, dynamic> object) {
    return Planet(
        climate: object['climate'],
        diameter: object['diameter'],
        gravity: object['gravity'],
        name: object['name'],
        orbitalPeriod: object['orbital_period'],
        population: object['population'],
        residents: object['residents'],
        rotationPeriod: object['rotation_period'],
        surfaceWater: object['surface_water'],
        terrain: object['terrain']);
  }

  static Future<Planet> getPlanet(String title) async {
    String apiURL = "https://swapi.dev/api/planets/?search=" + title;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    var planet = (jsonObject as Map<String, dynamic>)['results'][0];

    return Planet.createPlanet(planet);
  }

  static Future<Planet> getPlanetFromURL(String url) async {
    String apiURL = url;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    var planet = (jsonObject as Map<String, dynamic>);

    return Planet.createPlanet(planet);
  }

  static Future<List<Planet>> getListPlanets() async {
    String apiURL = "https://swapi.dev/api/planets/";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listPlanets = (jsonObject as Map<String, dynamic>)['results'];

    List<Planet> planets = [];
    for (int i = 0; i < listPlanets.length; i++) {
      planets.add(Planet.createPlanet(listPlanets[i]));
    }

    return planets;
  }
}
