import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ruhakids/Screens/MainScreen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ThanksGivingScreen extends StatefulWidget {
  @override
  static String id = "ThanksGivingScreen";

  _ThanksGivingScreenState createState() => _ThanksGivingScreenState();
}

class _ThanksGivingScreenState extends State<ThanksGivingScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

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
      body: WebView(
        initialUrl:
            "https://kidsapp.ruha.co.in/thanksgiving.php?rand_no=${MainScreen.session}",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webviewcontroller) {
          _controller.complete(webviewcontroller);
        },
      ),
    );
  }

  void dispose() {
    super.dispose();
  }
}
