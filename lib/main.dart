import 'package:covid19/pages/home_page.dart';
import 'package:covid19/pages/main_page.dart';
import 'package:covid19/ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  SharedPreferences sp;
  bool isSign = false;
  Future<bool> sh() async{
    sp = await SharedPreferences.getInstance();
    isSign = sp.getBool("isSign") == null?false:true;
    return isSign;
  }

  bool isTr(){
    sh().then((onValue){
      print(onValue);
    });
    return isSign;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'COVID 19',
              home: isTr() ? MainPage() :HomePage(),
            );
          },
        );
      },
    );
  }


}
