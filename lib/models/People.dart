import 'dart:convert';

import 'package:http/http.dart' as http;

class People {
  String name;
  String birthYear;
  String eyeColor;
  String gender;
  String hairColor;
  String height;
  String mass;
  String skinColor;
  String homeWorld;

  People(
      {this.name,
      this.birthYear,
      this.eyeColor,
      this.gender,
      this.hairColor,
      this.height,
      this.mass,
      this.skinColor,
      this.homeWorld});

  factory People.createPeople(Map<String, dynamic> object) {
    return People(
      name: object['name'],
      birthYear: object['birth_year'],
      eyeColor: object['eye_color'],
      gender: object['gender'],
      hairColor: object['hair_color'],
      height: object['height'],
      mass: object['mass'],
      homeWorld: object['homeworld'],
      skinColor: object['skin_color'],
    );
  }

  static Future<People> getPeople(String title) async {
    String apiURL = "https://swapi.dev/api/people/?search=" + title;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    var people = (jsonObject as Map<String, dynamic>)['results'][0];

    return People.createPeople(people);
  }

  static Future<List<People>> getListPeople() async {
    String apiURL = "https://swapi.dev/api/people/";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listPeople = (jsonObject as Map<String, dynamic>)['results'];

    List<People> peoples = [];
    for (int i = 0; i < listPeople.length; i++) {
      peoples.add(People.createPeople(listPeople[i]));
    }

    return peoples;
  }
}
