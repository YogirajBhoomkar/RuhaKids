import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  static String id = "MainScreen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String studentName = "Student Name";

  int number=1;
  void initState() {
    getStudentName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
//          title: Text(
//            "Ruha Kids",
//            style: TextStyle(
//              fontWeight: FontWeight.bold,
//              fontSize: 25,
//              color: Colors.white,
//            ),
//          ),
          flexibleSpace: Image(
            image: AssetImage("images/appBar.png"),
            fit: BoxFit.fitWidth,
          ),
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
                          fontSize: ScreenUtil().setSp(25),
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
                      getStudentName();
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
                    onTap: () {},
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
                    onTap: () {},
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: screendata(number),
        ),
      ),
    );
  }

  Widget screendata(int number) {
final Completer<WebViewController> _controller  = Completer<WebViewController>();
if (number ==1){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment:CrossAxisAlignment.center,
    children: [
      Container(
        width: 370.w,
        height: 70.h,
        child: Center(child: Column(mainAxisAlignment:MainAxisAlignment.center,children: [Text("Colors for Languages",style: TextStyle(color: Colors.white,fontFamily: "Roboto",fontSize: 22.w),),SizedBox(height: 5.h,),Text("(Click on Below Buttons to Hear a Sample)",style: TextStyle(color: Colors.white,fontFamily: "Roboto",fontSize: 12.w),)])),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(
            ScreenUtil().setSp(3),
          ),
        ),
      ),
      SizedBox(height: 10.h,),
      GestureDetector(
        onTap: (){
          playLocal("Red Color for English","Eng");
        },
        child: Container(
          width: 370.w,
          height: 70.h,
          child: Center(child: Text("Red Color for English",style: TextStyle(color: Colors.white,fontFamily: "Roboto",fontSize: 22.w),)),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(
              ScreenUtil().setSp(3),
            ),
          ),
        ),
      ),
      SizedBox(height: 10.h,),
      GestureDetector(
        onTap: (){
          playLocal("Orange Color for Sanskrit","Mar");
        },
        child: Container(
          width: 370.w,
          height: 70.h,
          child: Center(child: Text("Orange Color for Sanskrit",style: TextStyle(color: Colors.white,fontFamily: "Roboto",fontSize: 22.w),)),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(
              ScreenUtil().setSp(3),
            ),
          ),
        ),
      ),
      SizedBox(height: 10.h,),
      GestureDetector(
        onTap: (){
          playLocal("मराठीसाठी तपकिरी रंग","Mar");
        },
        child: Container(
          width: 370.w,
          height: 70.h,
          child: Center(child: Text("Brown Color for Marathi",style: TextStyle(color: Colors.white,fontFamily: "Roboto",fontSize: 22.w),)),
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(
              ScreenUtil().setSp(3),
            ),
          ),
        ),
      ),
      SizedBox(height: 10.h,),
      GestureDetector(
        onTap: (){
          playLocal("हिंदी के लिए हरा रंग","Hin");
        },
        child: Container(
          width: 370.w,
          height: 70.h,
          child: Center(child: Text("Green Color for Hindi",style: TextStyle(color: Colors.white,fontFamily: "Roboto",fontSize: 22.w),)),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(
              ScreenUtil().setSp(3),
            ),
          ),
        ),
      ),
      SizedBox(height: 10.h,),
//              Container(
//                width: 370.w,
//                height: 70.h,
//                child: Center(child: Text("Skip and Continue",style: TextStyle(color: Colors.white,fontFamily: "Roboto",fontSize: 22.w),)),
//                decoration: BoxDecoration(
//                  color: Colors.blueAccent,
//                  borderRadius: BorderRadius.circular(
//                    ScreenUtil().setSp(3),`
//                  ),
//                ),
//              ),
      Container(width:double.infinity,child: Image.asset('images/mainscreen.jpg'),),

    ],
  );
}
if(number ==2){
  return WebView(
    initialUrl: "https://google.com",
    javascriptMode: JavascriptMode.unrestricted,
    onWebViewCreated: (WebViewController  webviewcontroller){
      _controller.complete(webviewcontroller);
    },
  );
}
else {
  return Center(child: Container(child: Text("Thankyou for using Ruha Kids !"),),);
}




  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void signOut() async {
    SharedPreferences loginPrefs = await SharedPreferences.getInstance();
    loginPrefs.clear();
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void getStudentName() async {
    print("Hello");
    SharedPreferences loginPrefs = await SharedPreferences.getInstance();
    var url1 = "https://kidsapp.ruha.co.in/flutterGetStudentId.php";
    var url2 = "https://kidsapp.ruha.co.in/flutterGetStudentName.php";
    var data = {
      'parentMobile': loginPrefs.get('parentMobile'),
    };
    print(data);
    var response = await http.post(url1, body: json.encode(data));
    var message = jsonDecode(response.body);
    var kidsId = message['kids_id'];
    var data1 = {
      'id': kidsId,
    };
    var response1 = await http.post(url2, body: json.encode(data1));
    var name = jsonDecode(response1.body);
    setState(() {
      studentName = name['name'];
    });
  }
  playLocal(String speaking, String languageCode) async {
    VoiceController controller = FlutterTextToSpeech.instance.voiceController();
    controller.init().then((_) {
      controller.setLanguage(languageCode);
      controller.speak(
          speaking, VoiceControllerOptions(delay: 1));
    });
  }
}
