import 'package:covid19/ui/color.dart';
import 'package:flutter/material.dart';

class CoronaVirusPage extends StatefulWidget {
  @override
  _CoronaVirusPageState createState() => _CoronaVirusPageState();
}

class _CoronaVirusPageState extends State<CoronaVirusPage> {
  List corona = [
    {'pic': 'assets/img/c1.png', 'title': 'إلتهاب الحلق'},
    {'pic': 'assets/img/c2.png', 'title': 'سعال'},
    {'pic': 'assets/img/c3.png', 'title': 'ضيق في التنفس'},
    {'pic': 'assets/img/c4.png', 'title': 'الكثير من البلغم'},
    {'pic': 'assets/img/c5.png', 'title': 'حمى'},
    {'pic': 'assets/img/c6.png', 'title': 'إعياء'},
  ];

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
          margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: _width,
                  child: Center(
                    child: Text(
                      'أعراض مرض كورونا',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'HelveticaWorld',
                      ),
                    ),
                  ),
                ),

                // c
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  width: _width,
                  height: _height / 1.3,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: corona.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.all(10),
                          width: _width,
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 2),
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0, // has the effect of softening the shadow
                                  spreadRadius: 0.1,
                                  offset: Offset(
                                    1.0, // horizontal, move right 10
                                    1.0, // vertical, move down 10
                                  ),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      corona[index]['title'],
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'HelveticaWorld',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 20),
                                  child: Image.asset(corona[index]['pic']),
                                ),
                              ],
                            ),
                          ));
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
