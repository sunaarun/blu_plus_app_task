
import 'package:blu_plus_app/models/brain_model.dart';
import 'package:blu_plus_app/models/errors_enum.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../models/device_info.dart';

class BrainFunctions{

  static connectToUserDevice(Brain brain)
  {
    if(brain.flutterBlue.state == BluetoothState.on)
    {
      brain.flutterBlue.startScan(timeout: const Duration(seconds: 60)).then((value)  {
        try{
          brain.flutterBlue.scanResults.listen((event) {
            for(ScanResult r in event){
              Device d = Device(bluetoothDevice: r.device);
              brain.devices?.add(d);
              //devices![index].bluetoothDevice.connect(timeout: Duration(seconds: 4));
            }
          });
        }
        catch(e){
         brain.brainErrorType = BrainErrorType.userToBrain;
        //brain.codeList =ECodeList.searchForError(data,brain.brainErrorType);
        }
      });

    }
  }
  moreThanThree(Brain brain){
    if(brain.flutterBlue.state== BluetoothState.on)
      {
        brain.flutterBlue.startScan(timeout: Duration(seconds: 60)).then((value){
          try{
            brain.flutterBlue.scanResults.listen((event) {
              if(event.length<3) {
                for (ScanResult r in event) {
                  Device d = Device(bluetoothDevice: r.device);
                  brain.devices?.add(d);
                }
              }
            });
          }
          catch(e)
          {
            throw 'more than three';
          }
        });
      }
  }
}