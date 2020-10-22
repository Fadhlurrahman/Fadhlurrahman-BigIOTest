import 'package:bigio_test_fadhlurrahman/models/Films.dart';
import 'package:bigio_test_fadhlurrahman/sharedstyle/sharedstyle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SingleMovieView extends StatefulWidget {
  final String titlemovie;

  const SingleMovieView({this.titlemovie});
  @override
  _SingleMovieViewState createState() => _SingleMovieViewState();
}

class _SingleMovieViewState extends State<SingleMovieView> {
  @override
  Widget build(BuildContext context) {
    // final title = Provider.of<String>(context);
    return FutureBuilder(
      future: Film.getFilm(widget.titlemovie),
      builder: (context, snapshot) {
        Film film = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title: Text("Movie Information"),
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
                              flex: 3,
                              child: Container(
                                // color: Colors.red,
                                child: Row(
                                  children: [
                                    Flexible(
                                        flex: 4,
                                        child: ListView(
                                          children: [
                                            SharedStyle().listtileVer1("Title :", film.title, context),
                                            SharedStyle().listtileVer1("Director :", film.director, context),
                                            SharedStyle().listtileVer1("Producer :", film.produser, context),
                                            SharedStyle().listtileVer1("Release Date :",
                                                DateFormat('dd-MM-yyyy').format(film.releasedate), context)
                                          ],
                                        )),
                                    Flexible(
                                      flex: 2,
                                      child: Center(
                                        child: Icon(
                                          Icons.movie,
                                          color: Colors.white38,
                                          size: 100,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Flexible(
                              flex: 3,
                              child: Container(
                                // color: Colors.green,
                                height: MediaQuery.of(context).size.height,
                                child: SharedStyle().listtileVer2("Opening Crawl :", film.openingcrawl, context),
                              ))
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
