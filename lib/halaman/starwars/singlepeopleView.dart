import 'package:bigio_test_fadhlurrahman/models/People.dart';
import 'package:bigio_test_fadhlurrahman/models/Planet.dart';
import 'package:bigio_test_fadhlurrahman/sharedstyle/sharedstyle.dart';
import 'package:flutter/material.dart';

class SinglePeopleView extends StatefulWidget {
  final String namePeople;

  const SinglePeopleView({this.namePeople});
  @override
  _SinglePeopleViewState createState() => _SinglePeopleViewState();
}

class _SinglePeopleViewState extends State<SinglePeopleView> {
  @override
  Widget build(BuildContext context) {
    // final title = Provider.of<String>(context);
    return FutureBuilder(
      future: People.getPeople(widget.namePeople),
      builder: (context, snapshot) {
        People people = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title: Text("People Information"),
            backgroundColor: Colors.black,
          ),
          body: snapshot.hasData
              ? Container(
                  // color: Colors.red,
                  decoration:
                      BoxDecoration(image: DecorationImage(image: AssetImage('assets/sky-bg.jpg'), fit: BoxFit.cover)),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: Column(
                        children: [
                          Flexible(
                              flex: 4,
                              child: Container(
                                // color: Colors.red,
                                child: Row(
                                  children: [
                                    Flexible(
                                        flex: 4,
                                        child: ListView(
                                          children: [
                                            SharedStyle().listtileVer1("Name :", people.name, context),
                                            SharedStyle().listtileVer1("Birth Year :", people.birthYear, context),
                                            ListTile(
                                                title: Container(
                                                  margin: EdgeInsets.only(left: 5, bottom: 3),
                                                  child: Text(
                                                    "Gender :",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        letterSpacing: 1,
                                                        fontFamily: "Times New Roman",
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                subtitle: people.gender == "male"
                                                    ? ImageIcon(
                                                        AssetImage('assets/male.png'),
                                                        color: Colors.white70,
                                                        size: 80,
                                                      )
                                                    : people.gender == "female"
                                                        ? ImageIcon(AssetImage('assets/female.png'),
                                                            color: Colors.white70, size: 80)
                                                        : people.gender == "unknown"
                                                            ? ImageIcon(
                                                                AssetImage('assets/unknown.png'),
                                                                color: Colors.white70,
                                                                size: 80,
                                                              )
                                                            : ImageIcon(
                                                                AssetImage('assets/n_a.png'),
                                                                color: Colors.white70,
                                                                size: 80,
                                                              ))
                                          ],
                                        )),
                                    Flexible(
                                      flex: 2,
                                      child: Center(
                                        child: ImageIcon(
                                          AssetImage('assets/people.png'),
                                          color: Colors.white38,
                                          size: 100,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Flexible(
                              flex: 6,
                              child: Container(
                                  // color: Colors.green,
                                  height: MediaQuery.of(context).size.height,
                                  child: ListView(
                                    children: [
                                      SharedStyle().listtileVer1("Eye Color :", people.eyeColor, context),
                                      SharedStyle().listtileVer1("Hair Color :", people.hairColor, context),
                                      SharedStyle().listtileVer1("Skin Color :", people.skinColor, context),
                                      SharedStyle().listtileVer1("Height :", people.height + " cm", context),
                                      SharedStyle().listtileVer1("Mass :", people.mass + " kilograms", context),
                                      FutureBuilder(
                                          future: Planet.getPlanetFromURL(people.homeWorld),
                                          builder: (context, snapshot) {
                                            Planet planet = snapshot.data;
                                            if (snapshot.hasData) {
                                              return SharedStyle().listtileVer1("Homeworld :", planet.name, context);
                                            } else {
                                              return Container();
                                            }
                                          }),
                                    ],
                                  )))
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
