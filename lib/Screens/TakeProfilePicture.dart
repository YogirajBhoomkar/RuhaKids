import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruhakids/Screens/MainScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:image_picker/image_picker.dart';

class TakeProfilePictureScreen extends StatefulWidget {
  @override
  static String id = "TakeProfilePictureScreen";

  @override
  _TakeProfilePictureScreen createState() => _TakeProfilePictureScreen();
}

class _TakeProfilePictureScreen extends State<TakeProfilePictureScreen> {
  var FileUploaded = false;

  File _image;

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
        body: Center(
          child: SingleChildScrollView(
            child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                  child: Text(
                    "Set your child's\nProfile Picture !",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: ScreenUtil().setSp(30),
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF807B)),
                    textAlign: TextAlign.center,
                  ),
                ),
       _image == null ? Text("Still waiting!") : Image.file(_image),
                     Container(
                        width: 200.w,
                        height: 200.h,
                        margin: EdgeInsets.all(40.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFFFF807B), width: 2),
                            image: DecorationImage(
                                image: AssetImage('images/profileAvatar.png')),
                            shape: BoxShape.circle),
                     ),
                Container(
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF807B),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.4,
                          style: BorderStyle.solid,
                          color: Color(0xFFFF807B)),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                  width: 200.w,
                  height: 50.h,
                  child: FlatButton(
                    onPressed: () {
                      if (_image==null) {
                        Alert(
                          context: context,
                          type: AlertType.success,
                          title: "Select Image from",
                          desc: "Set a cute picture of your child !",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Gallery",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: (){
                      getImageFile(ImageSource.gallery);
                      },
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                            ),
                            DialogButton(
                              child: Text(
                                "Camera",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed:(){
                                getImageFile(ImageSource.camera);
                              },
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(116, 116, 191, 1.0),
                                Color.fromRGBO(52, 138, 199, 1.0)
                              ]),
                            )
                          ],
                        ).show();
                      } else {
                       // Navigator.pushNamed(context, MainScreen.id);
                      }
                    },
                    child: FileUploaded == false
                        ? Text(
                            "Set Profile Picture",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(17),
                                color: Colors.white,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400),
                          )
                        : Text(
                            "Next",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(17),
                                color: Colors.white,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400),
                          ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Image.asset('images/selfie.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
Future<void>getImageFile(ImageSource source)async{
    ImagePicker imagePicker = ImagePicker();
    try{
      var Image = await imagePicker.getImage(source: source);
      setState(() {
        _image=File(Image.path);
        FileUploaded=true;
      });
    }catch(e){print(e);}


  }
}
