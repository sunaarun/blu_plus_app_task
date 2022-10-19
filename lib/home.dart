import 'package:app_settings/app_settings.dart';
import 'package:blu_plus_app/pages/BrainORJSON.dart';
import 'package:blu_plus_app/pages/brain_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: StreamBuilder<BluetoothState>(
      initialData: BluetoothState.unknown,
      stream: FlutterBluePlus.instance.state,
      builder: (context, snapshot) {
        if(snapshot.data == BluetoothState.on)
          {
            return const BrainJSON();
          }
        else if(snapshot.data == BluetoothState.unavailable)
          {
            throw 'something went wrong';
          }
        else{
          return Center(
            child: TextButton(
              onPressed: (){
                AppSettings.openBluetoothSettings();
              },
              child: Text("Enable BLUETOOTH"),
            ),
          );
        }
      }
    ),
    );
  }
}
