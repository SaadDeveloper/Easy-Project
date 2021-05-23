import 'package:easy/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class YearScreen extends StatelessWidget {
  List<String> years = ['2020','2019',];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'SELEZIONA L\'ANNO',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: kText2Color,
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: years.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                child: Container(
                  height: SizeConfig.screenWidth * 0.12,
                  color: kPrimaryColor.withOpacity(0.7),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(10)),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(
                            'assets/images/tap.svg',
                            height: getProportionateScreenWidth(30),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            years[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionateScreenWidth(25),
                              fontFamily: 'Comfortaa',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
