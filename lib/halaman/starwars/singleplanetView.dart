import 'package:bigio_test_fadhlurrahman/models/Planet.dart';
import 'package:bigio_test_fadhlurrahman/sharedstyle/sharedstyle.dart';
import 'package:flutter/material.dart';

class SinglePlanetView extends StatefulWidget {
  final String titlePlanet;

  const SinglePlanetView({this.titlePlanet});
  @override
  _SinglePlanetViewState createState() => _SinglePlanetViewState();
}

class _SinglePlanetViewState extends State<SinglePlanetView> {
  @override
  Widget build(BuildContext context) {
    // final title = Provider.of<String>(context);
    return FutureBuilder(
      future: Planet.getPlanet(widget.titlePlanet),
      builder: (context, snapshot) {
        Planet planet = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title: Text("Planet Information"),
            backgroundColor: Colors.black,
          ),
          body: snapshot.hasData
              ? Container(
                  // color: Colors.red,
                  decoration:
                      BoxDecoration(image: DecorationImage(image: AssetImage('assets/sky-bg.jpg'), fit: BoxFit.cover)),
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: Column(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Container(
                                // color: Colors.green,
                                height: MediaQuery.of(context).size.height,
                                child: Center(
                                  child: ImageIcon(
                                    AssetImage('assets/planet.png'),
                                    color: Colors.white38,
                                    size: 100,
                                  ),
                                ),
                              )),
                          Flexible(
                              flex: 5,
                              child: Container(
                                // color: Colors.red,
                                child: Row(
                                  children: [
                                    Flexible(
                                        flex: 4,
                                        child: ListView(
                                          children: [
                                            SharedStyle().listtileVer1("Name :", planet.name, context),
                                            SharedStyle().listtileVer1("Diameter :", planet.diameter, context),
                                            SharedStyle()
                                                .listtileVer1("Rotation Period :", planet.rotationPeriod, context),
                                            SharedStyle()
                                                .listtileVer1("Orbital Period :", planet.orbitalPeriod, context),
                                            SharedStyle().listtileVer1("Gravity :", planet.gravity, context),
                                            SharedStyle().listtileVer1("Population :", planet.population, context),
                                            SharedStyle().listtileVer1("Climate :", planet.climate, context),
                                            SharedStyle().listtileVer1("Terrain :", planet.terrain, context),
                                            SharedStyle().listtileVer1("Surface Water :", planet.surfaceWater, context),
                                          ],
                                        )),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
        );
      },
    );
  }
}
