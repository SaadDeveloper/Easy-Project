import 'package:easy/apis/api_client.dart';
import 'package:easy/model/statistics_year.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy/screens/salvatore_sechi/salvatore_sechi_screen.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<StatisticsYear> futureStatisticsYear;
  String year = '2019';
  List<String> years = [
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
  ];

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  Future<void> refreshData() async {
    futureStatisticsYear =
        ApiClient.apiClient.statisticsYearApi(year).whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print('yy:' + year.toString());

    return FutureBuilder<StatisticsYear>(
      future: futureStatisticsYear,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data == null) {
          return emptyData('Data not found');
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return getView(snapshot.data);
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

  Widget getView(StatisticsYear statisticsYear) {
    return Container(
      decoration: BoxDecoration(
        gradient: kBackgroundGradient,
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    SizedBox(
                      height: getProportionateScreenWidth(20),
                    ),
                    SvgPicture.asset(
                      'assets/images/tower.svg',
                      height: getProportionateScreenWidth(80),
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildItem('ENERGIA\nPRELEVATA',
                            '${statisticsYear.energyDrawn.toString()} kWh'),
                        SvgPicture.asset(
                          'assets/images/down_01.svg',
                          height: getProportionateScreenWidth(80),
                        ),
                        SvgPicture.asset(
                          'assets/images/up_01.svg',
                          height: getProportionateScreenWidth(80),
                        ),
                        buildItem('ENERGIA\nIMMESSA',
                            '${statisticsYear.energyInjected.toString()} kWh'),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildItem('ENERGIA\nPRODOTTA',
                            '${statisticsYear.energyProduced.toString()} kWh'),
                        SvgPicture.asset(
                          'assets/images/solar_house.svg',
                          height: getProportionateScreenWidth(80),
                          color: Colors.green,
                        ),
                        Column(
                          children: [
                            buildItem('AUTOCONSUMO',
                                '${statisticsYear.selfConsumption.toString()}%'),
                            SizedBox(
                              height: getProportionateScreenWidth(10),
                            ),
                            buildItem('ENERGIA\nAUTOCONSUMATA',
                                '${statisticsYear.selfConsumedEnergy.toString()} kWh'),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/down_01.svg',
                          height: getProportionateScreenWidth(80),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(40),
                        ),
                        SvgPicture.asset(
                          'assets/images/up_01.svg',
                          height: getProportionateScreenWidth(80),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildItem('ACCUMULO\nNECESSARIO',
                            '${statisticsYear.accumulationEnergyNeeded.toString()} kWh'),
                        SvgPicture.asset(
                          'assets/images/battery.svg',
                          height: getProportionateScreenWidth(80),
                          color: Colors.green,
                        ),
                        buildItem('ACCUMULO\nINSTALLABILE',
                            '${statisticsYear.accumulationEnergyInstallable.toString()} kWh'),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildItem2('POTENZIAMENTO\nIMPIANTO',
                            '${statisticsYear.powerPlant.toString()} kWp'),
                        buildItem2('RISPARMIO\nIN BOLLETTA',
                            '${statisticsYear.billSaving.toString()} €'),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildItem2('POTENZIAMENTO\nIMPIANTO',
                            '${statisticsYear.differentialSsp.toString()} kWp'),
                        buildItem2('RISPARMIO\nIN BOLLETTA',
                            '${statisticsYear.cashAccumulation.toString()} €'),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(10),
                    ),
                  ],
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
                              'ANNO $year',
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
                  onTap: () {
                    Navigator.pushNamed(
                        context, SalvatoreSechiScreen.routeName);
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String title, String value) {
    return Container(
      height: SizeConfig.screenWidth * 0.3,
      width: SizeConfig.screenWidth * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: kText2Color,
                fontSize: getProportionateScreenWidth(12),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(2),
          ),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(18),
              fontFamily: 'Comfortaa',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem2(String title, String value) {
    return Container(
      height: SizeConfig.screenWidth * 0.2,
      width: SizeConfig.screenWidth * 0.45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: kText2Color,
                fontSize: getProportionateScreenWidth(12),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(2),
          ),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(20),
              fontFamily: 'Comfortaa',
            ),
          ),
        ],
      ),
    );
  }

  yearAlertDialog(BuildContext context) {
    print('aa: $year');
    AlertDialog alert = AlertDialog(
      content: Container(
        height: SizeConfig.screenHeight * 0.7,
        width: SizeConfig.screenWidth,
        child: Column(
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
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenWidth(8)),
                    child: GestureDetector(
                      onTap: () {
                        year = years[index];
                        Navigator.pop(context);
                        refreshData();
                      },
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
