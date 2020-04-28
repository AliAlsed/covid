import 'package:covid19/ui/color.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List corona = [
    {'pic': 'assets/img/pic1.jpg', 'title': 'Ali Jasim','sub':'FullStack Developer'},
    {'pic': 'assets/img/pic2.jpg', 'title': 'Ali Qzwini','sub':'UI Designer'},
    {'pic': 'assets/img/pic3.jpg', 'title': 'Suliman Ahmed','sub':'Mobile Devoloper'},
    {'pic': 'assets/img/pic4.jpg', 'title': 'Ammar Al-Wazzan','sub':'UX Designer'},
  ];

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
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: _width,
                      child: Center(
                        child: Text(
                          'GENX Group',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
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
                      // height: _height / 1.2,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: corona.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: EdgeInsets.all(10),
                              width: _width,
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(bottom: 5),
                                height: 100,
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
                                        padding: EdgeInsets.only(left: 30),
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              corona[index]['title'],
                                              textAlign: TextAlign.start,
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'HelveticaWorld',
                                              ),
                                            ),
                                            Text(
                                              corona[index]['sub'],
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 14,
                                                fontFamily: 'HelveticaWorld',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 60,
                                      height: 60,
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundImage:  AssetImage(corona[index]['pic']),
//                                    child: Image.asset(corona[index]['pic']),
                                      ),
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5000),

                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              )),
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
      )
    );
  }

}