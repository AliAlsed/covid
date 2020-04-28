import 'package:covid19/pages/home_page.dart';
import 'package:covid19/pages/login.dart';
import 'package:covid19/pages/main_page.dart';
import 'package:covid19/ui/color.dart';
import 'package:covid19/ui/size_config.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email = '';
  String _pass = '';

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: _width,
                  height: _height / 1.7,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/bg.png'),
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 50),
            width: _width,
            alignment: Alignment.topCenter,
            child: Text(
              'أنشاء حساب جديد',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: dark,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'HelveticaWorld'),
            ),
          ),
          Container(
            width: _width,
            height: _height / 2,
            margin: EdgeInsets.only(top: _height / 4, right: 20, left: 20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: darkGray2, width: 1.5),
                      borderRadius: BorderRadius.circular(500),
                      color: Colors.white.withOpacity(.5)),
                  child: TextField(
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    onSubmitted: (value){
                      _email = value;
                    },
                    style: TextStyle(
                        color: dark,
                        fontSize: 2.2 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'HelveticaWorld'),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'البريد الألكتروني',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: darkGray2, width: 1.5),
                      borderRadius: BorderRadius.circular(500),
                      color: Colors.white.withOpacity(.5)),
                  child: TextField(
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    onSubmitted: (value){
                      _pass = value;
                    },
                    obscureText: true,
                    style: TextStyle(
                        color: dark,
                        fontSize: 2.2 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'HelveticaWorld'),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'الرمز',
                    ),
                  ),
                ),
                Container(
                  width: _width * .9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute( builder: (_) => LoginPage())
                          );
                        },
                        child: Text(
                          'لديك حساب؟',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: darkGray2,
                              fontSize: 2.2 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'HelveticaWorld'),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute( builder: (_) => MainPage()),
                            ModalRoute.withName(''),
                          );
                        },
                        child: Container(
                          width: _width * .35,
                          height: 50,
                          decoration: BoxDecoration(
                              color: dark,
                              borderRadius: BorderRadius.circular(500)
                          ),
                          child: Center(
                            child: Text(
                              'تسجيل الدخول',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: whiteGray,
                                  fontSize: 2.2 * SizeConfig.textMultiplier,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'HelveticaWorld'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          
          Positioned(
            top: 60,
            left: 30,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.keyboard_arrow_left,size: 3.9 * SizeConfig.heightMultiplier,color: dark,),
            ),
          ),


          Positioned(
            bottom: 30,
            child: Container(
              width: _width,
              child: Center(
                child: Text(
                  "Copyright © 2020 ,  Genx Group",
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
      ),
    );
  }
}
