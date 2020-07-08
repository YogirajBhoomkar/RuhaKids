import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ruhakids/Screens/MainScreen.dart';
import 'package:webview_flutter/webview_flutter.dart';
class FAQScreen extends StatefulWidget {
  static String id="FAQScreen";
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQScreen> {
  final Completer<WebViewController> _controller  = Completer<WebViewController>();
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
      body: WebView(
        initialUrl: "https://kidsapp.ruha.co.in/faq.php?rand_no=${MainScreen.session}",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webviewcontroller) {
          _controller.complete(webviewcontroller);
        },
      ),
    );
  }
  void dispose(){
    super.dispose();
  }
}
