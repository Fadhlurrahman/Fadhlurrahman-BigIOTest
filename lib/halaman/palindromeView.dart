import 'package:bigio_test_fadhlurrahman/fungsi/AllFunction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Palindrome extends StatefulWidget {
  @override
  _PalindromeState createState() => _PalindromeState();
}

class _PalindromeState extends State<Palindrome> {
  List<Characters> listcharawal = <Characters>[];
  List<Characters> palindromefinal = <Characters>[];
  TextEditingController characterInput = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Palindrome"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: characterInput,
                decoration: new InputDecoration(
                  hintText: "Masukkan Karakter",
                  labelText: "Masukkan Karakter",
                  border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(10)),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]")),
                  LengthLimitingTextInputFormatter(1)
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              RaisedButton(
                onPressed: () {
                  listcharawal.add(characterInput.value.text.characters);
                  print(listcharawal);
                  characterInput.text = "";
                  palindromefinal = AllFunction().palindrome(listcharawal);
                  print(palindromefinal.toString());
                  setState(() {});
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), side: BorderSide(width: 2, color: Colors.green[800])),
                color: Colors.green[400],
                child: Container(width: 200, height: 50, child: Center(child: Text("PUSH CHAR"))),
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              palindromefinal.isNotEmpty
                  ? Text(
                      palindromefinal.toString().replaceAll(",", ""),
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
