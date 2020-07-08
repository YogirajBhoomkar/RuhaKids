import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruhakids/Screens/MobileVerification.dart';
import 'package:http/http.dart' as http;
import 'package:ruhakids/Screens/PrimaryLanguage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterationScreen extends StatefulWidget {
  @override
  static String id = "RegisterationScreen";
  static String childName=null;
  static String childAge=null;
  static String parentsName=null;
  static String emailAddress=null;
  static String mobileNumber=null;
  static String session=null;
  static bool visitedRegisterationScreen;

  static var result;
  @override
  _RegisterationScreen createState() => _RegisterationScreen();
}

class _RegisterationScreen extends State<RegisterationScreen> {


  void init() {
    super.initState();


  }
  Widget build(BuildContext context) {
    setState(() {
      RegisterationScreen.visitedRegisterationScreen = true;
    });
    double defaultScreenWidth = 414.0;
    double defaultScreenHeight = 896.0;
    ScreenUtil.init(context,
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(20),),
                child: Center(
                  child: Container(
                    width: ScreenUtil().setWidth(300),
                    child: Image.asset('images/parents.png'),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Hello, Parents\nTell us about yourself !",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: ScreenUtil().setSp(27),
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0CBA9F)),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Tell us your name",
                      hintStyle: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: ScreenUtil().setSp(17),
                          fontWeight: FontWeight.w300)),
                  onChanged: (value) {
                    setState(() {
                      RegisterationScreen.parentsName=value;
                    });
                  },
                ),
                height: 50.h,
                width: 300.w,
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.4,
                        style: BorderStyle.solid,
                        color: Color(0xFF0CBA9F)),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Tell us your email address",
                      hintStyle: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: ScreenUtil().setSp(17),
                          fontWeight: FontWeight.w300)),
                  onChanged: (value) {
                    setState(() {
                      RegisterationScreen.emailAddress=value;
                    });
                  },
                ),
                height: 50.h,
                width: 300.w,
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.4,
                        style: BorderStyle.solid,
                        color: Color(0xFF0CBA9F)),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Tell us your mobile number",
                      hintStyle: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: ScreenUtil().setSp(17),
                          fontWeight: FontWeight.w300)),
                  onChanged: (value) {
                    setState(() {
                      RegisterationScreen.mobileNumber=value;
                    });
                  },
                ),
                height: 50.h,
                width: 300.w,
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.4,
                        style: BorderStyle.solid,
                        color: Color(0xFF0CBA9F)),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
              Container(
                decoration: ShapeDecoration(
                  color: Color(0xFF0CBA9F),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.4,
                        style: BorderStyle.solid,
                        color: Color(0xFF0CBA9F)),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
                margin: EdgeInsets.only(top: 30.h),
                width: 300.w,
                height: 50.h,
                child: FlatButton(
                    onPressed: ()async {
                      await getbasicInfo();
                      if(RegisterationScreen.childName!=null && RegisterationScreen.childName.length!=0) {
                        await sendToDatabase();
                        if (RegisterationScreen.session != null) {
                          print("going to getPassword");
                         await getPasscode();
                          print("Registeration of Result: ${RegisterationScreen.result}");
                          if(RegisterationScreen.result=="Inserted successfully"){
                            Navigator.pushReplacementNamed(context, MobileVerificationScreen.id);
                          }
                          else{
                            try{
                              Alert(
                                context: context,
                                type: AlertType.error,
                                title: "Error in Registering Student",
                                desc: "Please Retry",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Okay",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    width: 120,
                                  )
                                ],
                              ).show();
                            }catch(e){
                              print(e);
                            }

                          }
                        }
                      }
                      else{
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Error in Registering Student",
                          desc: "Either the user is already registered with the same mobile Number or check information filled",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Okay",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                            )
                          ],
                        ).show();
                      }


                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(17),
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                    )),
              ),
              SizedBox(height: 10.h,),
              Container(width:250.w,child: Text("Your data is 100% secure with us. We will never share it ! (Promise)",textAlign:TextAlign.center,style: TextStyle(fontFamily: "Roboto"),))
            ],
          ),
        ),
      ),
    );
  }
  void sendToDatabase() async{
    SharedPreferences loginPrefs = await SharedPreferences.getInstance();
    var url="https://kidsapp.ruha.co.in/flutterRegisterKid.php";
    var data = {
      'name':RegisterationScreen.childName,
      'age':RegisterationScreen.childAge,
    };
    var response = await http.post(url, body: json.encode(data));
    var message = jsonDecode(response.body);
    loginPrefs.setString('sessionId', message);
    setState(() {
      RegisterationScreen.session=message;
    });
      print("From sendtoDatabase: $message");

  }
  void getbasicInfo() async{
    SharedPreferences loginPrefs = await SharedPreferences.getInstance();
    setState(() {
      RegisterationScreen.childName = loginPrefs.get('name');
      RegisterationScreen.childAge = loginPrefs.get('age');

    });
  }

  void getPasscode() async{
    SharedPreferences loginPrefs = await SharedPreferences.getInstance();
    print(FileImage(File(loginPrefs.getString('test_image'))));
    String primaryLanguage =loginPrefs.get('primaryLanguage');
    var url="https://kidsapp.ruha.co.in/flutterSendPasscode.php";
    loginPrefs.setString('parentMobile', RegisterationScreen.mobileNumber);
    var data = {
      'parentName':RegisterationScreen.parentsName,
      'parentMobile':RegisterationScreen.mobileNumber,
      'parentEmail':RegisterationScreen.emailAddress,
      'primaryLanguage': PrimaryLanguage.primaryLanguage,
      'sessionId':loginPrefs.get('sessionId'),
      'profileImage':File(loginPrefs.getString('test_image')),
    };
    print(data);
    var response = await http.post(url, body: json.encode(data));
    var message = jsonDecode(response.body);
    print(response.body);
        setState(() {
          RegisterationScreen.result=message['msg'];
        });
      }
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
