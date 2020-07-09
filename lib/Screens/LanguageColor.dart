import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

class LanguageColorScreen extends StatefulWidget {
  static String id = "LanguageColorScreen";

  @override
  _LanguageColorScreenState createState() => _LanguageColorScreenState();
}

class _LanguageColorScreenState extends State<LanguageColorScreen> {

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
          flexibleSpace: Image(
            image: AssetImage("images/appBar.png"),
            fit: BoxFit.fitWidth,
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 370.w,
                height: 70.h,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text(
                        "Colors for Languages",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontSize: 22.w),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "(Click on Below Buttons to Hear a Sample)",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontSize: 12.w),
                      )
                    ])),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setSp(3),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  playLocal("Red Color for English", "Eng");
                },
                child: Container(
                  width: 370.w,
                  height: 70.h,
                  child: Center(
                      child: Text(
                    "Red Color for English",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontSize: 22.w),
                  )),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setSp(3),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  playLocal(
                      "संस्कृतभाषायाहा कृते नारंगवर्णस्य उपयोगं कुरु", "Mar");
                },
                child: Container(
                  width: 370.w,
                  height: 70.h,
                  child: Center(
                      child: Text(
                    "Orange Color for Sanskrit",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontSize: 22.w),
                  )),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setSp(3),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  playLocal("मराठीसाठी Brown रंग", "Mar");
                },
                child: Container(
                  width: 370.w,
                  height: 70.h,
                  child: Center(
                      child: Text(
                    "Brown Color for Marathi",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontSize: 22.w),
                  )),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setSp(3),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  playLocal("हिंदी के लिए हरा रंग", "Hin");
                },
                child: Container(
                  width: 370.w,
                  height: 70.h,
                  child: Center(
                      child: Text(
                    "Green Color for Hindi",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontSize: 22.w),
                  )),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setSp(3),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: double.infinity,
                child: Image.asset('images/mainscreen.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  playLocal(String speaking, String languageCode) async {
    VoiceController controller = FlutterTextToSpeech.instance.voiceController();
    controller.init().then((_) {
      controller.setLanguage(languageCode);
      controller.speak(speaking, VoiceControllerOptions(delay: 0));
    });
  }

  void dispose() {
    super.dispose();
  }
}
