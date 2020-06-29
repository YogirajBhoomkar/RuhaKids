import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
class MainScreen extends StatefulWidget {
  static String id = "MainScreen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 414.0;
    double defaultScreenHeight = 896.0;
    ScreenUtil.init(context,
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: false);
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(

//          title: Text(
//            "Ruha Kids",
//            style: TextStyle(
//              fontWeight: FontWeight.bold,
//              fontSize: 25,
//              color: Colors.white,
//            ),
//          ),
          flexibleSpace: Image(image: AssetImage("images/appBar.png"),fit: BoxFit.fitWidth,),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
      ),
      drawer: Container(
        width: 270.w,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                height: 230.h,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(

                    children: [
                      Container(width:120.w,height:120.h ,child: Image.asset("images/small.png")),
                      SizedBox(height: 15.h,),
                      Text(
                        "Jui Shaligram",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(25), color: Color(0xFFFF807B),),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      size: ScreenUtil().setHeight(25),
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {

                    },
                  ),

                  ListTile(
                    leading: Icon(
                      Icons.search,
                      size: ScreenUtil().setHeight(25),
                    ),
                    title: Text(
                      'Search',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.color_lens,
                      size: ScreenUtil().setHeight(25),
                    ),
                    title: Text(
                      'Language Colors',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.star,
                      size: ScreenUtil().setHeight(25),
                    ),
                    title: Text(
                      'Thanksgiving',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      size: ScreenUtil().setHeight(25),
                    ),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                    },
                  ),


                  ListTile(
                    leading: Icon(
                      Icons.contact_mail,
                      size: ScreenUtil().setHeight(25),
                    ),
                    title: Text(
                      'Contact',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.question_answer,
                      size: ScreenUtil().setHeight(25),
                    ),
                    title: Text(
                      'FAQ',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.insert_drive_file,
                      size: ScreenUtil().setHeight(25),
                    ),
                    title: Text(
                      'Privacy Policy',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height:ScreenUtil().setHeight(20)),
                  ListTile(
                    leading: Icon(
                      Icons.input,
                      size: ScreenUtil().setHeight(25),
                    ),
                    title: Text(
                      'Sign Out',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {},
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
      body: Center(child: Container(child: Text("Web View"),)),
    );
  }
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}

