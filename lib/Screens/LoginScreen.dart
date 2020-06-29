import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruhakids/Screens/RegisterationScreen.dart';
import 'package:ruhakids/Screens/MobileVerification.dart';

class LoginScreen extends StatefulWidget {
  @override
  static String id = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dropdownValue = '2-3';

  Widget build(BuildContext context) {
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
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: 120.w, top: 20.h, right: 120.w, bottom: 40.h),
                  child: Container(child: Image.asset('images/small.png'))),
              Text(
                "Personalize your child’s\nlearning experience",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: ScreenUtil().setSp(27),
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF0CBA9F)),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 50.h,
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.5,
                        style: BorderStyle.solid,
                        color: Color(0xFF0CBA9F)),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                width: 300.w,
                child: DropdownButton<String>(
                  underline: Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  items: <String>['2-3', '4-5', '6-7', '8-9', '10-11']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: ScreenUtil().setSp(20),
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0CBA9F)),
                      ),
                    );
                  }).toList(),
                  isExpanded: true,
                  value: dropdownValue,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Color(0xFF0CBA9F),
                  ),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
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
                      hintText: "Enter child's name here.",
                      hintStyle: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: ScreenUtil().setSp(17),
                          fontWeight: FontWeight.w300)),
                  onChanged: (value) {
                    print(value);
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
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterationScreen.id);
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(17),
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                    )),
              ),
              Container(
                decoration: ShapeDecoration(
                  color: Color(0xFFFFC400),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.4,
                        style: BorderStyle.solid,
                        color: Color(0xFFFFC402)),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
                margin: EdgeInsets.only(top: 15.h),
                width: 300.w,
                height: 50.h,
                child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MobileVerificationScreen.id);
                    },
                    child: Text(
                      "Enter Passcode",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(17),
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400),
                    ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom:10.h,right: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[Container(
                    constraints: BoxConstraints.expand(width: 250.w,height: 245.h),
                    width: 250.w,
                    height: 150.h,
                    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('images/kidsStudy.jpg'),fit: BoxFit.cover),
                    ),
                  ),],

                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
