import 'package:easy/screens/salvatore_sechi/salvatore_sechi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'year_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 130,
                lineWidth: 8.0,
                center: Text(
                  '92%',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: getProportionateScreenWidth(30),
                  ),
                ),
                percent: 0.8,
                animation: true,
                progressColor: kPrimaryColor,
                circularStrokeCap: CircularStrokeCap.round,
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              SvgPicture.asset(
                'assets/images/thumb.svg',
                height: getProportionateScreenWidth(50),
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.black12,
            child: Center(
              child: Text('The graph is in working phase'),
            ),
          ),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                yearAlertDialog(context);
              },
              child: Container(
                height: SizeConfig.screenWidth * 0.12,
                color: kPrimaryColor,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          'ANNO 2020',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(25),
                            fontFamily: 'Comfortaa',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: getProportionateScreenWidth(10)),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          'assets/images/tap.svg',
                          height: getProportionateScreenWidth(30),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(5),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, SalvatoreSechiScreen.routeName);
              },
              child: Container(
                height: SizeConfig.screenWidth * 0.12,
                color: kTextLight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LISTA IMPIANTI     ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.menu_open_sharp,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  yearAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Container(
        height: SizeConfig.screenHeight * 0.25,
        width: SizeConfig.screenWidth,
        child: YearScreen(),
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
