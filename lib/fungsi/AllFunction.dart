import 'package:flutter/cupertino.dart';

class AllFunction {
  String chipertext(String text, int perpindahan) {
    int panjangtext = text.length;
    String result = "";
    for (int i = 0; i < panjangtext; i++) {
      if (text[i] != " ") {
        if (text[i].codeUnits.first + perpindahan > 122) {
          result += String.fromCharCode(text[i].codeUnits.first - 26 + perpindahan);
        } else {
          result += String.fromCharCode(text[i].codeUnits.first + perpindahan);
        }
        // result += String.fromCharCode(text[i].codeUnits.first + perpindahan);
        // result += (text[i].codeUnits.first - 25).toString();
      } else {
        String space = " ";
        result += space;
      }
    }
    return result;
  }

  List<Characters> palindrome(List<Characters> listchar) {
    List<Characters> results = <Characters>[];
    int lengthlist = listchar.length;
    results.length = listchar.length + (listchar.length - 1);
    if (lengthlist != 1) {
      for (int i = 0; i < lengthlist; i++) {
        if (i != lengthlist - 1) {
          if (results.isEmpty) {
            results.add(Characters(listchar[i].toString()));
          } else {
            results[i] = Characters(listchar[i].toString());
          }

          results[lengthlist + lengthlist - 2 - i] = Characters(listchar[i].toString());
        } else {
          results[lengthlist - 1] = Characters(listchar[i].toString());
        }
      }
    } else {
      results[0] = Characters(listchar[0].toString());
    }
    print(results);

    return results;
  }

  String reverse(String textawal) {
    if (textawal.length == 0) {
      return textawal;
    } else {
      return reverse(textawal.substring(1)) + textawal[0];
    }
  }

  List<List<dynamic>> makeitButterflyMatrix(String textnumber) {
    int length = textnumber.length;
    int rowcol = length * 2 - 1;
    var matrixtable = List.generate(rowcol, (index) => List(rowcol), growable: true);
    for (int i = 0; i < length; i++) {
      for (int j = i; j < rowcol - i; j++) {
        matrixtable[j][i] = textnumber[i];
        matrixtable[j][rowcol - 1 - i] = textnumber[i];
      }
    }

    //just for test
    for (int l = 0; l < rowcol; l++) {
      print(matrixtable[l].toString() + "\n");
    }

    return matrixtable;
  }
}
