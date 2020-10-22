import 'package:bigio_test_fadhlurrahman/halaman/starwars/singlemovieView.dart';
import 'package:bigio_test_fadhlurrahman/models/Films.dart';
import 'package:bigio_test_fadhlurrahman/sharedstyle/sharedstyle.dart';
import 'package:flutter/material.dart';

class MoviesStarwars extends StatefulWidget {
  @override
  _MoviesStarwarsState createState() => _MoviesStarwarsState();
}

class _MoviesStarwarsState extends State<MoviesStarwars> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Film>>(
      future: Film.getListFilm(),
      builder: (context, snapshot) {
        List<Film> listfilm = snapshot.data;

        return Scaffold(
            appBar: AppBar(
              title: Text("List Film"),
              backgroundColor: Colors.black,
            ),
            body: snapshot.hasData
                ? Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/movies-bg.jpg'), fit: BoxFit.cover)),
                    child: ListView(
                      children: listfilm
                          .map((e) =>
                              // ListTile(
                              //       shape: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(10),
                              //           side: BorderSide(color: Colors.blue, width: 1)),

                              //       title: Text("Judul Film : " + e.title),
                              //     )
                              SharedStyle().buttonInfo(e.title, () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return SingleMovieView(
                                    titlemovie: e.title,
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
