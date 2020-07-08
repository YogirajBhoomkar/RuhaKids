import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:ruhakids/Screens/ContactScreen.dart';
import 'package:ruhakids/Screens/FAQScreen.dart';
import 'package:ruhakids/Screens/LanguageColor.dart';
import 'package:ruhakids/Screens/LoginScreen.dart';
import 'package:ruhakids/Screens/PrivacyPolicy.dart';
import 'package:ruhakids/Screens/RegisterationScreen.dart';
import 'package:ruhakids/Screens/SettingsScreen.dart';
import 'package:ruhakids/Screens/ThanksGivingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  static String id = "MainScreen";
  static var session;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Completer<WebViewController> _controller  = Completer<WebViewController>();
  String studentName = "Student Name";
  int number=1;
  var kidsId;

  void initState() {
    getStudentName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    getPrimaryLanguage();
    double defaultScreenWidth = 414.0;
    double defaultScreenHeight = 896.0;
    ScreenUtil.init(context,
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Image(
            image: AssetImage("images/appBar.png"),
            fit: BoxFit.fitWidth,
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FutureBuilder<WebViewController>(future:_controller.future,builder:(BuildContext context,AsyncSnapshot<WebViewController>controller){
        if(controller.hasData){
          return Container(
            width: 200.w,
            child: FloatingActionButton.extended(icon: Icon(Icons.arrow_back),onPressed: (){
              var can= controller.data.canGoBack().then((value) => {
                if(value){
                  controller.data.goBack(),
                }else{
                }

              });


            },label:Text("Back"),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w),),),
          );
        }
        else {
          return Container();
        }
      },),
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
                      Container(
                          width: 120.w,
                          height: 120.h,
                          child: Image.asset("images/small.png")),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        studentName,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(22),
                          color: Color(0xFFFF807B),
                        ),
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
                      setState(() {
                        number=1;
                      });
                      Navigator.pop(context);
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
                      setState(() {
                        number=2;
                      });
                      Navigator.pop(context);
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
                    onTap: () {
                      Navigator.pushNamed(context, LanguageColorScreen.id);
                    },
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
                      Navigator.pushNamed(context, ThanksGivingScreen.id);
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
                      Navigator.pushNamed(context, SettingsScreen.id);

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
                    onTap: () {
                      Navigator.pushNamed(context, ContactScreen.id);
                    },
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
                    onTap: () {
                      Navigator.pushNamed(context, FAQScreen.id);
                    },
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
                    onTap: () {
                      Navigator.pushNamed(context, PrivacyPolicyScreen.id);
                    },
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
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
                    onTap: () {
                      signOut();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: WebView(
        initialUrl: "https://kidsapp.ruha.co.in/kids_select_category.php?lang=english&rand_no=${MainScreen.session}",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webviewcontroller) {
          _controller.complete(webviewcontroller);
        },
      ),
    );
  }

  void getPrimaryLanguage()async{
    SharedPreferences loginPrefs = await SharedPreferences.getInstance();
    var url = "https://kidsapp.ruha.co.in/flutterGetPrimaryLanguage.php";
    var data = {
    'passcode': loginPrefs.get('passcode'),
  };
    var response = await http.post(url, body: json.encode(data));
    try{
      var message = jsonDecode(response.body);
    }catch(e){
      print(e);
    }

  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void signOut() async {
    SharedPreferences loginPrefs = await SharedPreferences.getInstance();
    loginPrefs.clear();
    Navigator.pushReplacementNamed(context, LoginScreen.id);
  }

  void getStudentName() async {
    SharedPreferences loginPrefs = await SharedPreferences.getInstance();
    try{


    var url2 = "https://kidsapp.ruha.co.in/flutterGetStudentName.php";
    var url1 = "https://kidsapp.ruha.co.in/flutterGetStudentId.php";
    var data = {
      'parentMobile': loginPrefs.get('parentMobile'),
    };
    var response = await http.post(url1, body: json.encode(data));
    var message = jsonDecode(response.body);
    setState(() {
      kidsId = message['kids_id'];
    });

    var data1 = {
      'id': kidsId,
    };
    var response1 = await http.post(url2, body: json.encode(data1));
    var name = jsonDecode(response1.body);
    setState(() {
      studentName = name['name'];
    });
    setSessionId();
    }catch(e){
      setState(() {
      });
      print(e);
    }

  }


  void setSessionId()async {
    var url3 = "https://kidsapp.ruha.co.in/flutterGetSession.php";
    var data = {
      'kids_id': kidsId,
    };
    var response = await http.post(url3, body: json.encode(data));
    var message = jsonDecode(response.body);
    print("Session: $message");
    setState(() {
      MainScreen.session=message['rand_no'];
    });
  }
}
