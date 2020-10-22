import 'package:bigio_test_fadhlurrahman/models/Vehicle.dart';
import 'package:bigio_test_fadhlurrahman/sharedstyle/sharedstyle.dart';
import 'package:flutter/material.dart';

class SingleVehicleView extends StatefulWidget {
  final String titleVehicle;

  const SingleVehicleView({this.titleVehicle});
  @override
  _SingleVehicleViewState createState() => _SingleVehicleViewState();
}

class _SingleVehicleViewState extends State<SingleVehicleView> {
  @override
  Widget build(BuildContext context) {
    // final title = Provider.of<String>(context);
    return FutureBuilder(
      future: Vehicle.getVehicle(widget.titleVehicle),
      builder: (context, snapshot) {
        Vehicle vehicle = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title: Text("Vehicle Information"),
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
                                    AssetImage('assets/vehicle.png'),
                                    color: Colors.white38,
                                    size: 100,
                                  ),
                                ),
                              )),
                          Flexible(
                              flex: 5,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                // color: Colors.red,
                                child: Row(
                                  children: [
                                    Flexible(
                                        flex: 4,
                                        child: ListView(
                                          children: [
                                            SharedStyle().listtileVer1("Name :", vehicle.name, context),
                                            SharedStyle().listtileVer1("Model :", vehicle.model, context),
                                            SharedStyle()
                                                .listtileVer1("Vehicle Class :", vehicle.vehicleClass, context),
                                            SharedStyle().listtileVer1("Manufacturer :", vehicle.manufacturer, context),
                                            SharedStyle().listtileVer1("Length :", vehicle.length + " Meters", context),
                                            SharedStyle().listtileVer1("Cost of the Vehicle :",
                                                vehicle.costInCredits + " Galactic Credits", context),
                                            SharedStyle().listtileVer1(
                                                "Number of Personel to run :", vehicle.crew + " Personnels", context),
                                            SharedStyle().listtileVer1(
                                                "Max Passengers :", vehicle.passengers + " Passengers", context),
                                            SharedStyle().listtileVer1(
                                                "Max Atmosphering Speed :", vehicle.maxAtmospheringSpeed, context),
                                            SharedStyle().listtileVer1(
                                                "Cargo Capacity :", vehicle.cargoCapacity + " Kilograms", context),
                                            SharedStyle().listtileVer1(
                                                "Max length of Time vehicle can provide consumables :",
                                                vehicle.consumables,
                                                context),
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
