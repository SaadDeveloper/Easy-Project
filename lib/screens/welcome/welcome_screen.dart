import 'package:easy/constants.dart';
import 'package:easy/screens/welcome/components/body.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/welcome";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Body(),
      ),
    );
  }

  Future<bool> onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text(
              'Are you sure?',
              style: TextStyle(
                fontFamily: 'Comfortaa',
              ),
            ),
            content: new Text(
              'Do you want to exit an App?',
              style: TextStyle(
                fontFamily: 'Comfortaa',
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  'No',
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    color: kPrimaryColor,
                  ),
                ),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text(
                  'Yes',
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
}
