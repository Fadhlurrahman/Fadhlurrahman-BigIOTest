import 'package:bigio_test_fadhlurrahman/halaman/starwars/singlepeopleView.dart';
import 'package:bigio_test_fadhlurrahman/models/People.dart';
import 'package:bigio_test_fadhlurrahman/sharedstyle/sharedstyle.dart';
import 'package:flutter/material.dart';

class PeoplesStarwars extends StatefulWidget {
  @override
  _PeoplesStarwarsState createState() => _PeoplesStarwarsState();
}

class _PeoplesStarwarsState extends State<PeoplesStarwars> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<People>>(
      future: People.getListPeople(),
      builder: (context, snapshot) {
        List<People> listpeople = snapshot.data;

        return Scaffold(
            appBar: AppBar(
              title: Text("List People"),
              backgroundColor: Colors.black,
            ),
            body: snapshot.hasData
                ? Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/people-bg.jpg'), fit: BoxFit.cover)),
                    child: ListView(
                      children: listpeople
                          .map((e) => SharedStyle().buttonInfo(e.name, () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return SinglePeopleView(
                                    namePeople: e.name,
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
