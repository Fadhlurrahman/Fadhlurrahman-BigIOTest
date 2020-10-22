import 'package:flutter/material.dart';

class SharedStyle {
  Widget buttonOnList(String text, Function action) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: RaisedButton(
        onPressed: action,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), side: BorderSide(width: 2, color: Colors.blue[800])),
        color: Colors.blue[400],
        child: Container(width: 200, height: 50, child: Center(child: Text(text))),
      ),
    );
  }

  Widget buttonStarWarsBig(BuildContext context, String title, ImageProvider<dynamic> bg, MaterialColor color,
      Widget imageicon, Function onpressed) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Material(
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), side: BorderSide(width: 3, color: color[700])),
        // child: FlatButton(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: bg, fit: BoxFit.cover), borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.blue
                ),
                width: MediaQuery.of(context).size.width * 0.55,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        color: Colors.white,
                        backgroundColor: Colors.white30),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: imageicon,
                ),
                // color: Colors.red,
              )
            ],
          ),
        ),
        //   onPressed: () {},
        // ),
      ),
      onPressed: onpressed,
    );
  }

  Widget buttonInfo(String title, Function func, BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: func,
      child: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('assets/sky-bg.jpg'),
            //   fit: BoxFit.cover,
            // ),
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
            // backgroundColor: Colors.white30,
          ),
        )),
      ),
    );
  }

  ListTile listtileVer1(String title, String desc, BuildContext context) {
    return ListTile(
        title: Container(
          margin: EdgeInsets.only(left: 5, bottom: 3),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                fontFamily: "Times New Roman",
                color: Colors.white,
                fontSize: 18),
          ),
        ),
        subtitle: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.blue, width: 3)),
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.2,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    desc,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  ListTile listtileVer2(String title, String desc, BuildContext context) {
    return ListTile(
        title: Container(
          margin: EdgeInsets.only(left: 5, bottom: 3),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                fontFamily: "Times New Roman",
                color: Colors.white,
                fontSize: 18),
          ),
        ),
        subtitle: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.blue, width: 3)),
          child: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.4,
            // width: MediaQuery.of(context).size.width * 0.1,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      desc,
                      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      // maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  RaisedButton closeDialogButton(BuildContext context) {
    return RaisedButton(
      child: Text("Close"),
      color: Colors.redAccent,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
