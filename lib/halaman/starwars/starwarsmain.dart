import 'package:bigio_test_fadhlurrahman/halaman/starwars/movies.dart';
import 'package:bigio_test_fadhlurrahman/halaman/starwars/peoples.dart';
import 'package:bigio_test_fadhlurrahman/halaman/starwars/planets.dart';
import 'package:bigio_test_fadhlurrahman/halaman/starwars/vehicles.dart';
import 'package:bigio_test_fadhlurrahman/sharedstyle/sharedstyle.dart';
import 'package:flutter/material.dart';

class StarWarsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Star Wars Main Menu"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/sky-bg.jpg'), fit: BoxFit.cover)),
        // child: SingleChildScrollView(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            SharedStyle().buttonStarWarsBig(
                context,
                "MOVIES",
                AssetImage('assets/movies-bg.jpg'),
                Colors.green,
                Icon(
                  Icons.movie,
                  size: 100,
                  color: Colors.white70,
                ), () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MoviesStarwars();
              }));
            }),
            Padding(padding: EdgeInsets.only(top: 10)),
            SharedStyle().buttonStarWarsBig(
                context,
                "PLANETS",
                AssetImage('assets/planet-bg.jpg'),
                Colors.green,
                ImageIcon(
                  AssetImage('assets/planet.png'),
                  color: Colors.white70,
                  size: 100,
                ), () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PlanetsStarwars();
              }));
            }),
            Padding(padding: EdgeInsets.only(top: 10)),
            SharedStyle().buttonStarWarsBig(
                context,
                "VEHICLES",
                AssetImage('assets/vehicles-bg.jpg'),
                Colors.green,
                ImageIcon(
                  AssetImage('assets/vehicle.png'),
                  color: Colors.white70,
                  size: 100,
                ), () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return VehiclesStarwars();
              }));
            }),
            Padding(padding: EdgeInsets.only(top: 10)),
            SharedStyle().buttonStarWarsBig(
                context,
                "PEOPLE",
                AssetImage('assets/people-bg.jpg'),
                Colors.green,
                ImageIcon(
                  AssetImage('assets/people.png'),
                  color: Colors.white70,
                  size: 100,
                ), () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PeoplesStarwars();
              }));
            })
          ],
        ),
      ),
    );
  }
}
