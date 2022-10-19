import 'dart:convert';

import 'package:blu_plus_app/db_files/CodeReasonObj.dart';
import 'package:blu_plus_app/models/errors_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class DBHendler {
  late var data;
  late String jsonFile;
  Future<void> LoadJSON() async {
    jsonFile = await rootBundle.loadString('assets/code.json');
    if (jsonFile != null) {
      data = json.decode(data);
    }
    else {
      throw 'Cannot load file';
    }
    print("..loading");
  }


  List<CodeReasonObj> searchForError(r,
      BrainErrorType brainErrorType) {
    List<CodeReasonObj> g = [];
    for (int index = 0; index < data.length; index++) {
      if (data[index]['Category'] == 'Brain') {
        for (int i = 0; i < data[index]['Value'].length; i++) {
          if (data[index]['Value'][i]['ErrorType'] ==
              brainErrorType.toString()) {
            g = List.generate(
                data[index]['Value'][i]['ErrorList'].length,
                    (j) =>
                    CodeReasonObj(
                        HexCode: data[index]['Value'][i]['ErrorList'][j]['HexCode'],
                        DecCode: data[index]['Value'][i]['ErrorList'][j]['DecCode'],
                        reason: data[index]['Value'][i]['ErrorList'][j]['reason'])
            );
            for (int i = 0; i < g.length; i++) {
              print(g[i].HexCode);
            }
          }
        }
      }
    }
    return g;
  }
}