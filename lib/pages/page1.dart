import 'package:covid19/blocks/load_block.dart';
import 'package:covid19/blocks/loaders.dart';
import 'package:covid19/model/Corona.dart';
import 'package:covid19/network/network.dart';
import 'package:covid19/pages/chat_page.dart';
import 'package:covid19/ui/color.dart';
import 'package:covid19/ui/iconx_icons.dart';
import 'package:covid19/ui/size_config.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  Network network = Network();
  List<Corona> corona =[];
  List<String> locations = [];
  String _selectedLocation;
  Corona _selectedContry = new Corona();

  bool con = false;

  @override
  void initState() {
    super.initState();
    this.network.fetch().then((onValue) {
      // print(onValue['countries_stat']);
      setState(() {
    
      for (var i in onValue['countries_stat']) {
        // print(i["country_name"]);
        locations.add(i["country_name"]);
        corona.add(new Corona(
            country_name: i["country_name"],
            cases: i["cases"],
            active_cases: i["active_cases"],
            deaths: i["deaths"],
            total_recovered: i["total_recovered"],
            new_death: i["new_deaths"],
            new_cases: i["new_cases"],
            serious_critical: i["serious_critical"]
            ));

            
      }
      print(corona[0]);
      print(locations[0]);
      _selectedLocation = locations[locations.indexOf("Iraq")];
      _selectedContry = corona[locations.indexOf("Iraq")];

      con = true;

      });
    });
  }


  

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: _width,
        height: _height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: _width,
                height: _height / 3,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(com), fit: BoxFit.cover)),
                    )
                  ],
                ),
              ),
              // Search Bar
              !con ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text(
                    'جاري الاتصال\nبقاعدة بيانات منظمة الصحة العالمية\nيرجى الانتظار ...',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: dark,
                      fontSize: 20,
                      fontFamily: 'HelveticaWorld',
                    ),)
                ],
              ) :Container(
                width: _width * .8,
                height: 64,
                margin: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: darkGray2, width: 1.5),
                    borderRadius: BorderRadius.circular(15)),
                child: DropdownButton(

                  icon: Icon(
                    Iconx.location,
                    color: darkGray2,
                  ),
                  hint: Container(
                    width: 240,
                    child: Text(
                      'لا يوجد اتصال بالانترنت',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: dark,
                        fontSize: 20,
                        fontFamily: 'HelveticaWorld',
                      ),
                    ),
                  ),
                  value: _selectedLocation,
                  style: TextStyle(
                    color: darkGray2,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaWorld',
                  ),
                  onChanged: (newValue) {
                    print(this.locations.indexOf(newValue));
                    setState(() {
                      _selectedLocation = newValue;
                      _selectedContry = this.corona[this.locations.indexOf(newValue)];
                    });
                  },
                  items: locations.map((location) {
                    return DropdownMenuItem(
                      child: Text(
                        location,
                        softWrap: true,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: darkGray2,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'HelveticaWorld',
                        ),
                      ),
                      value: location,
                    );
                  }).toList(),
                ),
              ),

              // Section
              !con? SizedBox() :Container(
                width: _width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   buildBlock(
                        color: dark,
                        icon: Iconx.user_times,
                        title: 'حالات الوفاة',
                        cases: this._selectedContry.deaths.toString()),
                    buildBlock(
                        color: gold,
                        icon: Iconx.users,
                        title: 'اجمالي الحالات',
                        cases: this._selectedContry.cases.toString())
                  ],
                ),
              ),
              !con? SizedBox() :Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: _width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    buildBlock(
                        color: orange,
                        icon: Iconx.user,
                        title: 'الحالات الخطرة',
                        cases: this._selectedContry.serious_critical.toString()),
                    buildBlock(
                        color: green,
                        icon: Iconx.user,
                        title: 'حالات الشفاء',
                        cases: this._selectedContry.total_recovered.toString()),
                  ],
                ),
              ),
              !con? SizedBox() :Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: _width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   buildBlock(
                        color: dark,
                        icon: Iconx.user_times,
                        title: 'الوفيات الجديدة',
                        cases: this._selectedContry.new_death.toString()),
                    buildBlock(
                        color: Colors.blueAccent,
                        icon: Iconx.user_plus,
                        title: 'الحالات الجديدة',
                        cases: this._selectedContry.new_cases.toString())
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildBlock({Color color, IconData icon, String title, String cases}) {
    return Container(
      width: 40 * SizeConfig.widthMultiplier,
      height: 165,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: 5.0,
            spreadRadius: 0.1,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            alignment: Alignment.topRight,
            child: Icon(
              icon,
              color: whiteGray,
              size: 3 * SizeConfig.heightMultiplier,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            alignment: Alignment.center,
            child: Text(
              cases.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: whiteGray,
                  fontSize: 32,
              fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: whiteGray,
                fontSize: 20,
                fontFamily: 'HelveticaWorld',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
