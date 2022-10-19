

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DealWithBLE{


  // Future<Stream<BrainErrorType>> connectToBLE()async{
  //   return
  // }
  checkBle(FlutterBluePlus flutterBlue){
    if(flutterBlue.state == BluetoothState.off)
    {
     // brainErrorType = BrainErrorType.BLEToBrain;
    }
    else{
      connect();
    }
  }
  connect()
  {
    // BrainFunctions.connectToUserDevice(this);
  }
  disConnectDevice(BluetoothDevice bluetoothDevice){
    return  bluetoothDevice.disconnect();
  }
  connectDevice(BluetoothDevice bluetoothDevice){
    return bluetoothDevice.connect();
  }
}