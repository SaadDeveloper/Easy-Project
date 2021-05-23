import 'package:easy/components/pref_manager.dart';
import 'package:easy/constants.dart';
import 'package:easy/screens/monitored_system/components/subscription_preview.dart';
import 'package:easy/screens/plant_detail/plant_detail_screen.dart';
import 'package:easy/model/photo_voltaic.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Body extends StatefulWidget {
  Future<PhotoVoltaic> futurePhotoVoltaic;

  Body(this.futurePhotoVoltaic);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PhotoVoltaic>(
      future: widget.futurePhotoVoltaic,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data == null) {
          return emptyData('Data not found');
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          if(snapshot.data.pvGse.isNotEmpty) {
            PrefManager.setEnergyAccount(
                snapshot.data.pvGse[0].energyAccount.toString());
          }
          if(snapshot.data.pvProcessed.isNotEmpty) {
            PrefManager.setPvId(snapshot.data.pvProcessed[0].pvId.toString());
            return getView(snapshot.data.pvProcessed);
          }else{
            return emptyData('Data not found');
          }
        } else if (snapshot.hasError) {
          return Text(snapshot.error);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget emptyData(String title) {
    return Container(
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              // fontSize: SizeConfig.safeBlockVertical * 3,
              ),
        ),
      ),
    );
  }

  Widget getListOfPhotoVoltaic(PhotoVoltaic photoVoltaic){
    return ListView.builder(
      itemCount: photoVoltaic.pvProcessed.length,
      itemBuilder: (context, index) {
        return getView(photoVoltaic.pvProcessed[index]);
      },
    );
  }
  Widget getView(PvProcessed pvProcessed) {
    return Container(
      decoration: BoxDecoration(
        gradient: kBackgroundGradient,
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: ListView(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Container(
              height: SizeConfig.screenWidth * 0.12,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(
                    LineIcons.solarPanel,
                    color: Colors.white,
                    size: getProportionateScreenWidth(30),
                  ),
                  Flexible(
                    child: Center(
                      child: Text(
                        '${pvProcessed.denomination}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildItem('TOTAL ENERGY',
                    '${pvProcessed.totalEnergy} KWh'),
                buildItem('TOTAL INCENTIVES',
                    '${pvProcessed.totalIncentives} €'),
              ],
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Center(
              child: Text(
                'PLANT YIELD',
                style: TextStyle(
                  color: kTextLight,
                  fontSize: getProportionateScreenWidth(20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularPercentIndicator(
                    radius: 100,
                    lineWidth: 8.0,
                    center: Text(
                      '${pvProcessed.yieldYear}%',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: getProportionateScreenWidth(20),
                      ),
                    ),
                    percent: pvProcessed.yieldYear,
                    animation: true,
                    progressColor: kPrimaryColor,
                    circularStrokeCap: CircularStrokeCap.round,
                    footer: buildItem(
                        'LAST YEAR', '${pvProcessed.lastYear}'),
                  ),
                  CircularPercentIndicator(
                    radius: 100,
                    lineWidth: 8.0,
                    center: Text(
                      '${pvProcessed.yieldMonth}%',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: getProportionateScreenWidth(20),
                      ),
                    ),
                    percent: pvProcessed.yieldMonth,
                    animation: true,
                    progressColor: kPrimaryColor,
                    circularStrokeCap: CircularStrokeCap.round,
                    footer: buildItem('LAST MONTH',
                        '${pvProcessed.lastMonth}'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PlantDetailScreen.routeName);
                  },
                  child: Container(
                    height: SizeConfig.screenWidth * 0.12,
                    width: SizeConfig.screenWidth * 0.7,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: getProportionateScreenWidth(10),
                        ),
                        Text(
                          'PLANT DETAIL',
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.8)),
                        ),
                        SvgPicture.asset(
                          'assets/images/tap.svg',
                          height: getProportionateScreenWidth(30),
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _subscriptionDialog(context, pvProcessed);
                  },
                  child: Container(
                    height: SizeConfig.screenWidth * 0.12,
                    width: SizeConfig.screenWidth * 0.2,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      LineIcons.boxOpen,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: kText2Color,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
      ],
    );
  }

  void _subscriptionDialog(BuildContext context, PvProcessed pvProcessed){
    AlertDialog alert = AlertDialog(
      content: Container(
        width: SizeConfig.screenWidth,
        child: SubscriptionPreviewDialog(pvProcessed),
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
