import 'package:covid19/blocks/fancy_bottom-NAV.dart';
import 'package:covid19/pages/corona_page.dart';
import 'package:covid19/pages/gallery_page.dart';
import 'package:covid19/pages/page1.dart';
import 'package:covid19/ui/color.dart';
import 'package:covid19/ui/iconx_icons.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MainPage extends StatefulWidget {
  static final String path = "lib/src/pages/misc/navybar.dart";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void dispose() {
    indexcontroller.close();
    super.dispose();
  }

  PageController pageController = PageController(initialPage: 2);
  StreamController<int> indexcontroller = StreamController<int>.broadcast();
  int index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          indexcontroller.add(index);
        },
        controller: pageController,
        children: <Widget>[
          GalleryPage(),
          CoronaVirusPage(),
          Page1(),
        ],
      ),

      bottomNavigationBar: StreamBuilder<Object>(
          initialData: 2,
          stream: indexcontroller.stream,
          builder: (context, snapshot) {
            int cIndex = snapshot.data;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
              FancyBottomNavigation(
              backgroundColor: backgroundColor,

              currentIndex: cIndex,
              inactiveColor: Colors.grey,
              activeColor: whiteGray3,
              iconSize: 20,
              items: <FancyBottomNavigationItem>[
                FancyBottomNavigationItem(
                  icon: Icon(Icons.group_work,size: 24,),
                  title: Text(
                    'تطوير',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'HelveticaWorld',
                    ),
                  ),
                ),
                FancyBottomNavigationItem(
                  icon: Icon(Icons.security,size: 24,),
                  title: Text(
                    'الاعراض',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'HelveticaWorld',
                    ),
                  ),
                ),
                FancyBottomNavigationItem(
                  icon: Icon(Icons.home,size: 24,),
                  title: Text(
                    'الرئيسية',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'HelveticaWorld',
                    ),
                  ),
                ),
              ],
              onItemSelected: (int value) {
                indexcontroller.add(value);
                pageController.jumpToPage(value);
              },
            ),
                Container(height: 12,color: Colors.white,),

              ],
            );

          }),
    );
  }
}