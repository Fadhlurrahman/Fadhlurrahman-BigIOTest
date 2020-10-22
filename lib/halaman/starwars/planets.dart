import 'package:bigio_test_fadhlurrahman/halaman/starwars/singleplanetView.dart';
import 'package:bigio_test_fadhlurrahman/models/Planet.dart';
import 'package:bigio_test_fadhlurrahman/sharedstyle/sharedstyle.dart';
import 'package:flutter/material.dart';

class PlanetsStarwars extends StatefulWidget {
  @override
  _PlanetsStarwarsState createState() => _PlanetsStarwarsState();
}

class _PlanetsStarwarsState extends State<PlanetsStarwars> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Planet>>(
      future: Planet.getListPlanets(),
      builder: (context, snapshot) {
        List<Planet> listplanet = snapshot.data;

        return Scaffold(
            appBar: AppBar(
              title: Text("List Planet"),
              backgroundColor: Colors.black,
            ),
            body: snapshot.hasData
                ? Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/planet-bg2.jpg'), fit: BoxFit.cover)),
                    child: ListView(
                      children: listplanet
                          .map((e) => SharedStyle().buttonInfo(e.name, () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return SinglePlanetView(
                                    titlePlanet: e.name,
                                  );
                                }));
                              }, context))
                          .toList(),
                    ),
                  )
                : Container());
      },
    );
  }
}
