import 'package:easy/constants.dart';
import 'package:easy/screens/welcome/welcome_screen.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  static String routeName = "/my_splash";

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SplashScreen(
      seconds: 5,
      title: Text(
        'Easy',
        style: TextStyle(
          fontSize: getProportionateScreenWidth(25),
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Comfortaa',
        ),
      ),
      navigateAfterSeconds: WelcomeScreen.routeName,
      image: Image.asset('assets/images/launch_logo.png'),
      loaderColor: kPrimaryColor,
      photoSize: 100,
      gradientBackground: kBackgroundGradient,
    );
  }
}
