import 'package:bigio_test_fadhlurrahman/halaman/butterflyView.dart';
import 'package:bigio_test_fadhlurrahman/halaman/geserhurufView.dart';
import 'package:bigio_test_fadhlurrahman/halaman/palindromeView.dart';
import 'package:bigio_test_fadhlurrahman/halaman/reverseView.dart';
import 'package:bigio_test_fadhlurrahman/halaman/starwars/starwarsmain.dart';
import 'package:flutter/material.dart';
import 'sharedstyle/sharedstyle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIGIO TEST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'BigIO Test - Fadhlurrahman'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(5)),
              SharedStyle().buttonOnList("Geser Huruf (No.13)", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Chiper();
                }));
              }),
              SharedStyle().buttonOnList("Palindrome (No.14)", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Palindrome();
                }));
              }),
              SharedStyle().buttonOnList("Reverse (No.15)", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Reverse();
                }));
              }),
              SharedStyle().buttonOnList("Butterfly Matrix (No.16)", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ButterflyNumber();
                }));
              }),
              SharedStyle().buttonOnList("Star Wars (No.17)", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StarWarsMain();
                }));
              }),
            ],
          ),
        ));
  }
}
