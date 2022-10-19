import 'package:blu_plus_app/pages/brain_page.dart';
import 'package:blu_plus_app/pages/LoadErrorCategories.dart';
import 'package:flutter/material.dart';

class BrainJSON extends StatelessWidget {
  const BrainJSON({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed:(){navigateTo(context,BrainPage.brainName);},child: Text("Brain Page"),),
           TextButton(onPressed:(){navigateTo(context,LoadJSONFile.jfile);}, child: Text('JSON Page')),
          ],
        ),
      ),
    );
  }
  navigateTo(BuildContext context,String routeName)
  {
       Navigator.pushNamed(context, routeName);
  }
}
