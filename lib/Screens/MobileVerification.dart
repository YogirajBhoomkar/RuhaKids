import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileVerificationScreen extends StatefulWidget {
  @override
  static String id = "MobileVerificationScreen";

  @override
  _MobileVerificationScreen createState() => _MobileVerificationScreen();
}

class _MobileVerificationScreen extends State<MobileVerificationScreen> {

  @override
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset('images/kidOnLaptop.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(top:ScreenUtil().setHeight(60),bottom: ScreenUtil().setHeight(10)),
                  child: Text(
                    "Enter the Passcode.",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: ScreenUtil().setSp(30),
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF63609B)),
                    textAlign: TextAlign.center,
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
                        hintText: "Enter the passcode here",
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
                          color: Color(0xFF63609B)),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(50),),
                  child: Container(
                    decoration: ShapeDecoration(
                      color: Color(0xFF63609B),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.4,
                            style: BorderStyle.solid,
                            color: Color(0xFF63609B)),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 30.h),
                    width: 300.w,
                    height: 50.h,
                    child: FlatButton(
                        onPressed: () {

                        },
                        child: Text(
                          "Check",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(17),
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400),
                        ),),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}