import 'package:easy/constants.dart';
import 'package:easy/screens/services/services_screen.dart';
import 'package:easy/screens/account/account_screen.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavDrawer extends StatefulWidget {
  @override
  _CustomNavDrawerState createState() => _CustomNavDrawerState();
}

class _CustomNavDrawerState extends State<CustomNavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ServicesScreen.routeName);
                },
                child: drawerItem('assets/images/services.svg', 'Services'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AccountScreen.routeName);
                },
                child: drawerItem('assets/images/person.svg', 'Account'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: drawerItem('assets/images/lock.svg', 'Privacy Policy'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: drawerItem('assets/images/share.svg', 'Share App'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerItem(String url, String title) {
    return Container(
      color: Colors.transparent,
      child: ListTile(
        title: Row(
          children: [
            SvgPicture.asset(
              url,
              height: getProportionateScreenWidth(20),
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Text(
              '  $title',
              style: TextStyle(fontFamily: 'Comfortaa'),
            ),
          ],
        ),
      ),
    );
  }
}
