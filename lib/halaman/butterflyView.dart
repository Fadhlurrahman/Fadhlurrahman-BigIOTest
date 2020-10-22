import 'package:bigio_test_fadhlurrahman/fungsi/AllFunction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ButterflyNumber extends StatefulWidget {
  @override
  _ButterflyNumberState createState() => _ButterflyNumberState();
}

class _ButterflyNumberState extends State<ButterflyNumber> {
  TextEditingController textInput = new TextEditingController();
  String textakhir = "";
  List<List<dynamic>> isianakhir;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButterflyMatrix"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: textInput,
                decoration: new InputDecoration(
                  hintText: "Masukkan Angka",
                  labelText: "Masukkan Angka",
                  border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              RaisedButton(
                onPressed: () {
                  isianakhir = AllFunction().makeitButterflyMatrix(textInput.value.text);
                  setState(() {});
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), side: BorderSide(width: 2, color: Colors.green[800])),
                color: Colors.green[400],
                child: Container(width: 200, height: 50, child: Center(child: Text("Make it Butterfly Matrix"))),
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              isianakhir != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: isianakhir.map((e) => Text(e.toString().replaceAll(RegExp(r"[^0-9]"), "\t"))).toList(),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
