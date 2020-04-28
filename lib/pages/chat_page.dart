import 'package:covid19/ui/color.dart';
import 'package:covid19/ui/size_config.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: _width,
        height: _height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: darkGray2, width: 1.5),
                  borderRadius: BorderRadius.circular(500),
                  color: Colors.white.withOpacity(.5)),
              child: TextField(
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    color: dark,
                    fontSize: 2.2 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaWorld'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'أكتب رسالة',
                ),
              ),
            ),
            InkWell(
              onTap: (){
                print('Sent');
                Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text('تم الأرسال')
                ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3000),
                  color: dark,
                ),
                child: Center(
                  child: Text(
                    'أرسل',
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: whiteGray,
                        fontSize: 2.2 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'HelveticaWorld'),
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
