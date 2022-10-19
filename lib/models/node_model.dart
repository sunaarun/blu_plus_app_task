
import 'package:blu_plus_app/db_files/errorList.dart';
import 'package:blu_plus_app/models/device_info.dart';
import 'package:blu_plus_app/models/errors_enum.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';


class Node{
  String n_name;
  FlutterBluePlus flutterBlue;
  NodeErrorType nodeErrorType;
  List<Device>? deivces;
  List<errorList> codeList =[];
  Node({required this.n_name,required this.flutterBlue, this.nodeErrorType = NodeErrorType.undefined, this.deivces=null});

}
