import 'dart:convert';

import 'package:http/http.dart' as http;

class Vehicle {
  String name;
  String model;
  String vehicleClass;
  String manufacturer;
  String length;
  String costInCredits;
  String crew;
  String passengers;
  String maxAtmospheringSpeed;
  String cargoCapacity;
  String consumables;
  List<dynamic> pilots;

  Vehicle(
      {this.name,
      this.model,
      this.vehicleClass,
      this.manufacturer,
      this.crew,
      this.costInCredits,
      this.length,
      this.passengers,
      this.maxAtmospheringSpeed,
      this.cargoCapacity,
      this.consumables,
      this.pilots});

  factory Vehicle.createVehicle(Map<String, dynamic> object) {
    return Vehicle(
        model: object['model'],
        vehicleClass: object['vehicle_class'],
        manufacturer: object['manufacturer'],
        name: object['name'],
        length: object['length'],
        crew: object['crew'],
        costInCredits: object['cost_in_credits'],
        passengers: object['passengers'],
        maxAtmospheringSpeed: object['max_atmosphering_speed'],
        cargoCapacity: object['cargo_capacity'],
        consumables: object['consumables'],
        pilots: object['pilots']);
  }

  static Future<Vehicle> getVehicle(String title) async {
    String apiURL = "https://swapi.dev/api/vehicles/?search=" + title;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    var vehicle = (jsonObject as Map<String, dynamic>)['results'][0];

    return Vehicle.createVehicle(vehicle);
  }

  static Future<List<Vehicle>> getListVehicle() async {
    String apiURL = "https://swapi.dev/api/vehicles/";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listVehicles = (jsonObject as Map<String, dynamic>)['results'];

    List<Vehicle> vehicles = [];
    for (int i = 0; i < listVehicles.length; i++) {
      vehicles.add(Vehicle.createVehicle(listVehicles[i]));
    }

    return vehicles;
  }
}
