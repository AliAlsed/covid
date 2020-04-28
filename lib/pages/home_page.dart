import 'package:covid19/pages/login.dart';
import 'package:covid19/pages/main_page.dart';
import 'package:covid19/ui/color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences sp;
  @override
  void initState()  {
    super.initState();
  }
  void sh() async {
    sp = await SharedPreferences.getInstance();
    sp.setBool("isSign", true);
  }
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: _width,
                    height: _height / 1.7,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/bg.png'),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),

                  // COVID 19
                  Container(
                    width: _width * .9,
                    child: Text(
                      "COVID 19",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: dark
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: _width * .7,
                    child: Text(
                      "برنامج كوفد لمعرفة عدد الإصابات وعدد المعافين والوفيات السابقة والجديدة بسبب فايروس كورونا المستجد حسب ارقام منظمة الصحة العالمية",
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: darkGray2,
                        fontSize: 18,
                        fontFamily: 'HelveticaWorld',
                      ),
                    ),
                  ),

                  // Button
                  InkWell(
                    onTap: (){
                      sh();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute( builder: (_) => MainPage()),
                        ModalRoute.withName(''),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: _width * .7,
                      height: _height / 17,
                      child: Container(
                        decoration: BoxDecoration(
                          color: darkGray2,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'مشاهدة الاحصائيات',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: whiteGray,
                              fontFamily: 'HelveticaWorld',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

            ),
          ),
          Positioned(
            bottom: 30,
            child: Container(
              width: _width,
              child: Center(
                child: Text(
                  "Copyright © ${DateTime.now().year} ,  Genx Group",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 10,
                    color: text,
                    fontFamily: 'HelveticaWorld',
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
