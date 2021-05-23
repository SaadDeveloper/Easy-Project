import 'package:easy/constants.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'components/body.dart';

class ServicesScreen extends StatelessWidget {
  static String routeName = "/services";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: kPrimaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(SizeConfig.screenWidth*0.17),
            child: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SERVICES',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(20),
                    ),
                  ),
                  Text(
                    'WE OFFER ALL THE SERVICES YOU NEED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Body(),
        ),
      ),
    );
  }
}
