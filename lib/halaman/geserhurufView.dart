import 'package:bigio_test_fadhlurrahman/fungsi/AllFunction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Chiper extends StatefulWidget {
  @override
  _ChiperState createState() => _ChiperState();
}

class _ChiperState extends State<Chiper> {
  String textakhir = "";
  TextEditingController textawal = new TextEditingController();
  TextEditingController penambahan = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geser Angka(Chiper)"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: textawal,
                decoration: new InputDecoration(
                  hintText: "Masukkan Text Awal",
                  labelText: "Masukkan Text Awal",
                  border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(10)),
                ),
                inputFormatters: [
                  WhitelistingTextInputFormatter(RegExp(r"[a-zA-Z]+|\s")),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              TextField(
                controller: penambahan,
                decoration: new InputDecoration(
                  hintText: "Masukkan Jumlah Penggeseran",
                  labelText: "Masukkan Jumlah Penggeseran",
                  border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              RaisedButton(
                onPressed: () {
                  textakhir = AllFunction().chipertext(textawal.value.text, int.parse(penambahan.value.text));
                  print(textakhir);
                  setState(() {});
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), side: BorderSide(width: 2, color: Colors.green[800])),
                color: Colors.green[400],
                child: Container(width: 200, height: 50, child: Center(child: Text("Lihat Hasil Akhir"))),
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
