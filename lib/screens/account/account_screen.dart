import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'components/body.dart';

class AccountScreen extends StatelessWidget {
  static String routeName = "/account";
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
                    'ACCOUNT',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(20),
                    ),
                  ),
                  Text(
                    'personal account management',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
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
