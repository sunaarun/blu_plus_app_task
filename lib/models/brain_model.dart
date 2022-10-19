
import 'package:blu_plus_app/db_files/CodeReasonObj.dart';
import 'package:blu_plus_app/db_files/errorList.dart';
import 'package:blu_plus_app/models/device_info.dart';
import 'package:blu_plus_app/models/errors_enum.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class Brain{
  FlutterBluePlus flutterBlue;
  BrainErrorType brainErrorType;
  List<Device>? devices;
  List<CodeReasonObj> codeList =[];
  Brain({required this.flutterBlue, this.brainErrorType =BrainErrorType.undefined, this.devices=null});

}


