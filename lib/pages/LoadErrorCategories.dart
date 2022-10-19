import 'dart:convert';
import 'package:blu_plus_app/db_files/CodeReasonObj.dart';
import 'package:flutter/material.dart';

class LoadJSONFile extends StatelessWidget {
  LoadJSONFile({Key? key}) : super(key: key);
  static String jfile = 'jfile';
  TextStyle categoryStyle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigo);
  TextStyle reasonStyle = TextStyle(
    fontSize: 18,
    color: Colors.blue,
  );
  TextStyle branchStyle = TextStyle(fontSize: 17, color: Colors.blueGrey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Node Route"),
        ),
        //  backgroundColor: Colors.white,
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/code.json'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data!);
              String branch = '';
              List<CodeReasonObj> nodeErrorList = [];
              List<CodeReasonObj> brainErrorList = [];
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    if (data[index]['Category'] == 'NODE') {
                      for (int i = 0; i < data[index]['Value'].length; i++) {
                        branch = data[index]['Value'][i]['ErrorType'];
                        for (var j in data[index]['Value'][i]['ErrorList']) {
                          CodeReasonObj obj = CodeReasonObj(
                              HexCode: j['HexCode'],
                              DecCode: j['DecCode'],
                              reason: j['reason'] + '\n $branch');
                          nodeErrorList.add(obj);
                        }
                      }
                    } else {
                      for (int i = 0; i < data[index]['Value'].length; i++) {
                        branch = data[index]['Value'][i]['ErrorType'];
                        for (var j in data[index]['Value'][i]['ErrorList']) {
                          CodeReasonObj obj = CodeReasonObj(
                              HexCode: j['HexCode'],
                              DecCode: j['DecCode'],
                              reason: j['reason'] + '\n$branch');
                          brainErrorList.add(obj);
                        }
                      }
                    }
                    return ListTile(
                      leading: Text(
                        '\n' + data[index]['Category'],
                        style: categoryStyle,
                      ),
                      subtitle: data[index]['Category'] == 'NODE'
                          ? buildContainer(nodeErrorList)
                          : buildContainer(brainErrorList),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Something went wrong"),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  buildContainer(List<CodeReasonObj> errorList) {
    return Container(
        height: 400,
        child: ListView(
            children: errorList
                .map((e) => Card(
                      elevation: 0.5,
                      child: ListTile(
                        title: Text(
                          e.reason.toString(),
                          style: reasonStyle,
                        ),
                        subtitle: Text(
                            " Hex: " +
                                e.HexCode.toString() +
                                "\n Dec: " +
                                e.DecCode.toString() +
                                "\n",
                            style: branchStyle),
                      ),
                    ))
                .toList()));
  }
}
