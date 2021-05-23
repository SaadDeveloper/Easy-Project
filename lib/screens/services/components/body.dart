import 'package:easy/constants.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: kBackgroundGradient
            ),
            child: ListView.builder(
              itemCount: 10,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildItem();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildItem() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
      child: Container(
        height: SizeConfig.screenWidth * 0.40,
        width: SizeConfig.screenWidth,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  LineIcons.key,
                  size: getProportionateScreenWidth(60),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RECUPERO CREDENZIALI GSE',
                      style: TextStyle(
                        color: kText2Color,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.75,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Recuperiamo attraverso mandata di rappresentanza le vostre credenziali GSE',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
              child: SizedBox(
                height: SizeConfig.screenHeight * 0.06,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    primary:Color(0xFF5CB85C),
                  ),
                  child: Text(
                    'RS 4,663.79',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      fontFamily: 'Open Sans',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
