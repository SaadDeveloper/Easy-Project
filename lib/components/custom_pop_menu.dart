import 'package:easy/screens/welcome/welcome_screen.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomPopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case 1:
            Navigator.pushNamed(context, WelcomeScreen.routeName);
            break;

          default:
            break;
        }
      },
      itemBuilder: (context) => <PopupMenuEntry>[
        customMenuItem('LOGOUT', 1),
      ],
    );
  }

  PopupMenuItem customMenuItem(String title, int val) {
    return PopupMenuItem(
      value: val,
      height: getProportionateScreenWidth(10),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                fontFamily: 'Open Sans'),
          ),
          Container(
            width: getProportionateScreenWidth(5),
          ),
        ],
      ),
    );
  }
}
