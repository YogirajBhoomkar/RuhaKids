import 'package:flutter/material.dart';
import 'package:ruhakids/Screens/LoginScreen.dart';
import 'package:ruhakids/Screens/MainScreen.dart';
import 'package:ruhakids/Screens/PrimaryLanguage.dart';
import 'package:ruhakids/Screens/RegisterationScreen.dart';
import 'package:ruhakids/Screens/MobileVerification.dart';
import 'package:ruhakids/Screens/TakeProfilePicture.dart';
import 'Screens/SplashScreen.dart';
void main() {
  runApp(RuhaKids());
}

class RuhaKids extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Splashscreen.id,
      routes: {
        Splashscreen.id: (context) =>Splashscreen(),
        MainScreen.id:(context) =>MainScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterationScreen.id: (context) => RegisterationScreen(),
        MobileVerificationScreen.id: (context) => MobileVerificationScreen(),
        PrimaryLanguage.id: (context) => PrimaryLanguage(),
        TakeProfilePictureScreen.id: (context) => TakeProfilePictureScreen(),
      },
    );

  }
}

