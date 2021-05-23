import 'package:easy/screens/company_user/company_user_screen.dart';
import 'package:easy/screens/private_user/private_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              gradient: kBackgroundGradient,
            ),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ARE YOU INDIVIDUAL OR COMPANY?',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: Color(0x66000000),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(10),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, PrivateUserScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                      ),
                      child: Text(
                        'PRIVATE',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: getProportionateScreenWidth(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(2),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, CompanyUserScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                      ),
                      child: Text(
                        'COMPANY',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: getProportionateScreenWidth(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
