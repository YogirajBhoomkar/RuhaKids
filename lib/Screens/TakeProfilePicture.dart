import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruhakids/Screens/MainScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class TakeProfilePictureScreen extends StatefulWidget {
  @override
  static String id = "TakeProfilePictureScreen";

  @override
  _TakeProfilePictureScreen createState() => _TakeProfilePictureScreen();
}

class _TakeProfilePictureScreen extends State<TakeProfilePictureScreen> {
  var FileUploaded = false;
  ImagePicker imagePicker = ImagePicker();
  File _image;

  bool makeVisible = false;

  var kidsId;

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
                Container(
                  width: 200.w,
                  height: 200.h,
                  margin: EdgeInsets.all(40.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFFF807B), width: 2),
                      image: _image == null
                          ? DecorationImage(
                              image: AssetImage('images/profileAvatar.png'))
                          : DecorationImage(
                              image: FileImage(_image), fit: BoxFit.cover),
                      shape: BoxShape.circle),
                ),
                _image != null
                    ? Container(
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF807B),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.4,
                                style: BorderStyle.solid,
                                color: Color(0xFFFF807B),),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                        ),
                        width: 200.w,
                        height: 50.h,
                        child: FlatButton(
                          onPressed: () async {
                            if (_image == null) {
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
                                    onPressed: () {
                                      if (_image == null) {
                                        getImageFile(
                                            ImageSource.gallery, context);
                                      } else {
                                        setState(() {
                                          makeVisible = true;
                                        });

                                        Navigator.pushNamed(
                                            context, MainScreen.id);
                                      }

                                      Navigator.pop(context);
                                    },
                                    color: Color.fromRGBO(0, 179, 134, 1.0),
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "Camera",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {
                                      getImageFile(ImageSource.camera, context);
                                      Navigator.pop(context);
                                    },
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(116, 116, 191, 1.0),
                                      Color.fromRGBO(52, 138, 199, 1.0)
                                    ]),
                                  )
                                ],
                              ).show();
                            } else {

                              Navigator.pushNamed(context, MainScreen.id);
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
                      )
                    : Container(),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
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
                    onPressed: () async {
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: "Select Image from",
                        desc: "Set a cute picture of your child !",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Gallery",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              getImageFile(ImageSource.gallery, context);

                              setState(() {
                                if (makeVisible == false) makeVisible = true;
                              });

                              Navigator.pop(context);
                            },
                            color: Color.fromRGBO(0, 179, 134, 1.0),
                          ),
                          DialogButton(
                            child: Text(
                              "Camera",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              getImageFile(ImageSource.camera, context);
                              Navigator.pop(context);
                            },
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(116, 116, 191, 1.0),
                              Color.fromRGBO(52, 138, 199, 1.0)
                            ]),
                          )
                        ],
                      ).show();
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
                            "Reselect Image",
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
  void _upload() async{
    SharedPreferences loginPrefs = await SharedPreferences.getInstance();
    var url1 = "https://kidsapp.ruha.co.in/flutterGetStudentId.php";
    var data = {
      'parentMobile': loginPrefs.get('parentMobile'),
    };
    var response = await http.post(url1, body: json.encode(data));
    var message = jsonDecode(response.body);
    setState(() {
      kidsId = message['kids_id'];
      print("Kids Id: $kidsId");
    });
  }
  Future<void> getImageFile(ImageSource source, BuildContext Context) async {
    SharedPreferences loginPrefs = await SharedPreferences.getInstance();
    var Image = await imagePicker.getImage(source: source);
    setState(() {
      _image = File(Image.path);

    });
    if(await _image.exists()){
      String dir = path.dirname(_image.path);
      print("Old Path : ${path.basename(_image.path)}");
      String newPath = path.join(dir, 'KidsId.jpg');
      print("New Path : ${newPath}");

      loginPrefs.setString('profileImage',newPath);
    }
    final Directory directory = await getApplicationDocumentsDirectory();
    String Directorypath = directory.path;
    final File newImage = await _image.copy('$Directorypath/$kidsId.jpg');
    loginPrefs.setString('profileImage', newImage.path);
    setState(() {
      _image = newImage;
    });
    FileUploaded = true;
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
