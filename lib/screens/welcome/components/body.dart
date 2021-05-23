import 'package:easy/components/t.dart';
import 'package:easy/constants.dart';
import 'package:easy/screens/monitored_system/components/subscription_preview.dart';
import 'package:easy/screens/welcome/components/sign_in_screen.dart';
import 'package:easy/screens/welcome/components/terms_condition_screen.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: SizeConfig.screenWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            height: getProportionateScreenWidth(100),
                          ),
                          Text(
                            'easy',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: 'Comfortaa',
                                fontSize: getProportionateScreenWidth(40)),
                          ),
                          Text(
                            'FOTOVOLTAICO',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: 'Comfortaa',
                            ),
                          ),
                          Text(
                            'v.1.1.0',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'Do not have an account?',
                              style: TextStyle(
                                color: kTextColor,
                                fontFamily: 'Comfortaa',
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(5),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.06,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // termsAlertDialog(context);
                                  termsAlertDialog(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: kPrimaryColor,
                                ),
                                child: Text(
                                  'REGISTER FOR FREE!',
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(20),
                                    fontFamily: 'Open Sans',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(20),
                            ),
                            Text(
                              'or',
                              style: TextStyle(
                                color: kTextColor,
                                fontFamily: 'Comfortaa',
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(5),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.06,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {

                                  signInAlertDialog(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: kGreyColor,
                                ),
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: getProportionateScreenWidth(20),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Powered by\nSOSFER SRLS',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                color: kPrimaryColor,
                                fontSize: getProportionateScreenWidth(10),
                              ),
                            ),
                          ],
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

  signInAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Container(
        height: SizeConfig.screenHeight * 0.6,
        width: SizeConfig.screenWidth,
        child: SignInScreen(),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  termsAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: TermsConditionScreen(),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
