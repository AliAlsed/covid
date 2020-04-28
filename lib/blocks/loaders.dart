
import 'package:covid19/blocks/load_block.dart';
import 'package:flutter/material.dart';

class LoadersPage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/loaders.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loaders"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10.0,),
            LoaderTwo(),
            SizedBox(height: 10.0,),
          ],
        ),
      ),
    );
  }
}