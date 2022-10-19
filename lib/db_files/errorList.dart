import 'dart:convert';
import 'package:blu_plus_app/db_files/CodeReasonObj.dart';
import 'package:blu_plus_app/models/errors_enum.dart';
import 'package:flutter/services.dart';

class errorList {
  late String data;
  late var jsonFile;

  // List<CodeReasonObj> errorList= [];
  // ECodeList();
  // ECodeList.map(List<Map<String ,dynamic>> myList )
  // {
  //   for(Map<String, dynamic> map in myList)
  //     {
  //       CodeReasonObj obj =
  //       CodeReasonObj(HexCode: map['HexCode'], DecCode: map['DecCode'], reason: map['reason']);
  //       print(obj.DecCode.toString() +" "+ obj.HexCode + " " + obj.reason.toString() + "\n");
  //       errorList.add(obj);
  //
  //     }
  // }
  // getErrorList(String string, data){
  //   errorList = ECodeList.map(data) as List<CodeReasonObj>;
  //   return errorList;
  // }

  // StartLoadingDB() async{
  //    data = await rootBundle.loadString('assets/code.json') ;
  //   if(data !=null)
  //     {
  //       jsonFile= json.decode(data);
  //     }
  //   else{
  //     throw 'Cannot load file';
  //   }
  // }
  // startLoading() async {
  //   data = await rootBundle.loadString('assets/code.json');
  //   if (data != null) {
  //     jsonFile = json.decode(data);
  //   }
  //   else {
  //     throw 'Cannot load file';
  //   }
  // }
  //
  // static List<CodeReasonObj> searchForError(data, BrainErrorType brainErrorType) {
  //   List<CodeReasonObj> g = [];
  //   for (int index = 0; index < data.length; index++) {
  //     if (data[index]['Category'] == 'Brain') {
  //       for (int i = 0; i < data[index]['Value'].length; i++) {
  //         if (data[index]['Value'][i]['ErrorType'] ==
  //             brainErrorType.toString()) {
  //           g = List.generate(
  //               data[index]['Value'][i]['ErrorList'].length,
  //                   (j) =>
  //                   CodeReasonObj(
  //                       HexCode: data[index]['Value'][i]['ErrorList'][j]['HexCode'],
  //                       DecCode: data[index]['Value'][i]['ErrorList'][j]['DecCode'],
  //                       reason: data[index]['Value'][i]['ErrorList'][j]['reason'])
  //           );
  //           for (int i = 0; i < g.length; i++) {
  //             print(g[i].HexCode);
  //           }
  //         }
  //       }
  //     }
  //   }
  //   return g;
  // }
//    for (Map<String, dynamic> f in jsonFile)
//   {
//     if (data[index]['Category'] == 'Brain') {
//       for(int i = 0; i<data[index]['Value'].length; i++) {
//         if (data[index]['Value'][i]['ErrorType'] == 'backendToBrain')
//         {
//           List<CodeReasonObj> g = List.generate(data[index]['Value'][i]['ErrorList'].length,
//                   (j) => CodeReasonObj(
//                   HexCode:data[index]['Value'][i]['ErrorList'][j]['HexCode'],
//                   DecCode: data[index]['Value'][i]['ErrorList'][j]['DecCode'],
//                   reason: data[index]['Value'][i]['ErrorList'][j]['reason'])
//           );
//           print(g[0].HexCode);
//     // if(f['Category'] == 'Brain') {
//     //   for(int i =0; i<f['Value'].length; i++)
//     //     {
//     //       if(f['Value'][i]['ErrorType'] == 'userToBrain')
//     //         {
//     //           searchForBrainErrors(BrainErrorType.BLEToBrain, f['Value'][i]['ErrorList']);
//     //         }
//     //     }
//     // }
//     }
//
//   }
// }
//
//   searchForBrainErrors(BrainErrorType brainErrorType, data){
//     switch (brainErrorType) {
//       case BrainErrorType.undefined:
//         return null;
//         break;
//       case   BrainErrorType.userToBrain:
//         return getErrorList(brainErrorType.toString(),data);
//        break;
//       case   BrainErrorType.backendToBrain:
//         return getErrorList(brainErrorType.toString(),data);
//         break;
//       case   BrainErrorType.BLEToBrain:
//         return getErrorList(brainErrorType.toString(),data);
//         break;
//     }

}