import 'package:easy/model/data_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  Future<DataForm> futureDataForm;

  Body(this.futureDataForm);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DataForm>(
      future: widget.futureDataForm,
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

  Widget getView(DataForm dataForm) {
    return Container(
      decoration: BoxDecoration(
        gradient: kBackgroundGradient,
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                child: ListView(
                  children: [
                    Container(
                      height: SizeConfig.screenHeight * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10)),
                            child: Container(
                              height: SizeConfig.screenWidth * 0.12,
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    LineIcons.lightbulb,
                                    color: Colors.white,
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'IMPIANTO',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Comfortaa',
                                            fontSize:
                                                getProportionateScreenWidth(20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildItem('POD', dataForm.dataSheet[0].pod),
                              buildItem('DATA DI ESERCIZIO',
                                  dataForm.dataSheet[0].exerciseDate),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildItem('DENOMINAZIONE',
                                  dataForm.dataSheet[0].denomination),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildItem('ORIENTAMENTO',
                                  '${dataForm.dataSheet[0].orientation} °'),
                              buildItem('INCLINAZIONE',
                                  '${dataForm.dataSheet[0].inclination} °'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildItem('TENSIONE',
                                  '${dataForm.dataSheet[0].voltage} Volt'),
                              buildItem('POTENZA',
                                  '${dataForm.dataSheet[0].power} kWh'),
                              buildItem('SUPERFICIE',
                                  '${dataForm.dataSheet[0].surface} mq'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(10),
                    ),
                    Container(
                      height: SizeConfig.screenHeight * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10)),
                            child: Container(
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
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'MODULI',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Comfortaa',
                                            fontSize:
                                                getProportionateScreenWidth(20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildItem('TECHOLOGIA',
                                  dataForm.dataSheet[0].technologyModules),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildItem(
                                  'MARCA', dataForm.dataSheet[0].moduleBrand),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildItem('MODELLO',
                                  dataForm.dataSheet[0].modelModules),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildItem('NUMERO',
                                  dataForm.dataSheet[0].numberModules.toString()),
                              buildItem('POTENZA',
                                  '${dataForm.dataSheet[0].powerModules} watt'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(10),
                    ),
                    Container(
                      height: SizeConfig.screenHeight * 0.35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10)),
                            child: Container(
                              height: SizeConfig.screenWidth * 0.12,
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'INVERTER',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Comfortaa',
                                            fontSize:
                                                getProportionateScreenWidth(20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildItem(
                                  'MARCA', dataForm.dataSheet[0].inverterBrand),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildItem('MODELLO',
                                  dataForm.dataSheet[0].inverterModel),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildItem('NUMERO',
                                  dataForm.dataSheet[0].numberInverter.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(10),
                    ),
                    Container(
                      height: SizeConfig.screenHeight * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10)),
                            child: Container(
                              height: SizeConfig.screenWidth * 0.12,
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white,
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'UBICAZIONE',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Comfortaa',
                                            fontSize:
                                                getProportionateScreenWidth(20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildItem(
                                  'REGIONE', dataForm.dataSheet[0].region),
                              buildItem(
                                  'PROVINCIA', dataForm.dataSheet[0].province),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildItem('COMMUNE',
                                  dataForm.dataSheet[0].municipality),
                              buildItem(
                                  'CAP', dataForm.dataSheet[0].postalCode.toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildItem(
                                  'INDIRIZZO', dataForm.dataSheet[0].address),
                              buildItem(
                                  'CIVICO', dataForm.dataSheet[0].civicNumber.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(10),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xFFA3A3A3),
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
      ),
    );
  }

  Widget buildItem(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: kTextColor),
        ),
        Text(
          value,
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'Comfortaa',
          ),
        ),
      ],
    );
  }
}
