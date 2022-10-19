
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class Device{
 BluetoothDevice bluetoothDevice ;
 Device({required this.bluetoothDevice});
 get service=> bluetoothDevice.services;
 get characteristics => service.characteristics;
 bChracteristic() async
 {
   String charac ="";
   for(BluetoothCharacteristic c in characteristics)
    {
     List<int> value= await c.read();
     charac = charac + value.toString();
    }
  return charac;
 }
 bDescriptor()async{
  String des= "";
  // Reads all descriptors
  var descriptors = characteristics.descriptors;
  for(BluetoothDescriptor d in descriptors) {
   List<int> value = await d.read();
   print(value);
   des = des+ value.toString();
  }
  return des;
}

}
