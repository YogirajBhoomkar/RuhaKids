import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruhakids/Screens/PrimaryLanguage.dart';

class RegisterationScreen extends StatefulWidget {
  @override
  static String id = "RegisterationScreen";

  @override
  _RegisterationScreen createState() => _RegisterationScreen();
}

class _RegisterationScreen extends State<RegisterationScreen> {

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
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: TextField(
                  keyboardType: TextInputType.text,
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
                      Navigator.pushNamed(context, PrimaryLanguage.id);
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
            ],
          ),
        ),
      ),
    );
  }
}
