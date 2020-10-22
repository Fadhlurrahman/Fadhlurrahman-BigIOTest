import 'package:bigio_test_fadhlurrahman/fungsi/AllFunction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Reverse extends StatefulWidget {
  @override
  _ReverseState createState() => _ReverseState();
}

class _ReverseState extends State<Reverse> {
  // String textawal;
  String textakhir = "";
  TextEditingController textInput = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reverse"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: textInput,
                decoration: new InputDecoration(
                  hintText: "Masukkan Karakter",
                  labelText: "Masukkan Karakter",
                  border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(10)),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]")),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              RaisedButton(
                onPressed: () {
                  print(textInput.value.text);
                  textakhir = AllFunction().reverse(textInput.value.text);
                  print(textakhir);
                  setState(() {});
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), side: BorderSide(width: 2, color: Colors.green[800])),
                color: Colors.green[400],
                child: Container(width: 200, height: 50, child: Center(child: Text("REVERSE"))),
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              textakhir != ""
                  ? Text(
                      textakhir,
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
