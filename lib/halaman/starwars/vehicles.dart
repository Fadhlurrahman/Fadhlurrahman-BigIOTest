import 'package:bigio_test_fadhlurrahman/halaman/starwars/singlevehicleView.dart';
import 'package:bigio_test_fadhlurrahman/models/Vehicle.dart';
import 'package:bigio_test_fadhlurrahman/sharedstyle/sharedstyle.dart';
import 'package:flutter/material.dart';

class VehiclesStarwars extends StatefulWidget {
  @override
  _VehiclesStarwarsState createState() => _VehiclesStarwarsState();
}

class _VehiclesStarwarsState extends State<VehiclesStarwars> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Vehicle>>(
      future: Vehicle.getListVehicle(),
      builder: (context, snapshot) {
        List<Vehicle> listvehicle = snapshot.data;

        return Scaffold(
            appBar: AppBar(
              title: Text("List Vehicle"),
              backgroundColor: Colors.black,
            ),
            body: snapshot.hasData
                ? Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/vehicles-bg.jpg'), fit: BoxFit.cover)),
                    child: ListView(
                      children: listvehicle
                          .map((e) => SharedStyle().buttonInfo(e.name, () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return SingleVehicleView(
                                    titleVehicle: e.name,
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
