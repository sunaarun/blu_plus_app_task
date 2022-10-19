import 'package:blu_plus_app/BLEFunctions/DBHandler.dart';
import 'package:blu_plus_app/db_files/CodeReasonObj.dart';
import 'package:blu_plus_app/models/brain_model.dart';
import 'package:blu_plus_app/models/device_info.dart';
import 'package:blu_plus_app/models/errors_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BrainPage extends StatefulWidget {
  const BrainPage({Key? key}) : super(key: key);
  static String brainName = 'brain';
  @override
  State<BrainPage> createState() => _BrainPageState();
}

class _BrainPageState extends State<BrainPage> {
  DBHendler dbHendler = DBHendler();
  String n = "";
  late Brain brain;
  @override
  void initState() {
    super.initState();
    brain = Brain(flutterBlue: FlutterBluePlus.instance);
    brain.flutterBlue.startScan(timeout: Duration(seconds: 60));
    dbHendler.LoadJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Brain BLUTooth"),
        ),
        body: StreamBuilder<List<ScanResult>>(
          stream: brain.flutterBlue.scanResults,
          initialData: [],
          builder: (context, snapshot) {
            //List<String> list=[];
            if (snapshot.hasData) {
              //list = [''];
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) =>
                    buildListTile(snapshot.data![index], ),
                separatorBuilder: (context, i) => Divider(),
              );
            }
            if (snapshot.hasError) {
              return const Text("Error in result");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        floatingActionButton: StreamBuilder<bool>(
          stream: brain.flutterBlue.isScanning,
          initialData: false,
          builder: (c, snapshot) {
            if (snapshot.data!) {
              return FloatingActionButton(
                child: Icon(Icons.stop),
                onPressed: () => brain.flutterBlue.stopScan(),
                backgroundColor: Colors.red,
              );
            } else {
              return FloatingActionButton(
                  child: Icon(Icons.search),
                  onPressed: () => brain.flutterBlue
                      .startScan(timeout: Duration(seconds: 6)));
            }
          },
        ));
  }

  buildListTile(ScanResult r ) {
    String s ='';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: ListTile(
            leading: Text("${r.rssi}"),
            title: Text("  ${r.device.name}"),
            subtitle: Text(
                "ID : ${r.device.id.id} \n Manufacturer: ${r.advertisementData.manufacturerData}"+"\n"
                    "$n"),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 4,
          child: ElevatedButton(
              onPressed: () async {
                try {
                  print(r.device.services.toString());
                  await r.device.connect(
                    timeout: const Duration(seconds: 6),
                  );
                } catch (error) {
                  setState(() {
                    n = error.toString();
                    s =error.toString();
                    brain.brainErrorType = BrainErrorType.userToBrain;
                  });
                  print(error.toString());

                }
              },
              child: Text("Connect")),
        ),
      ],
    );
  }
}
