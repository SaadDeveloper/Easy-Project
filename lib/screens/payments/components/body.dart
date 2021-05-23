import 'package:easy/model/payment_ce.dart';
import 'package:easy/screens/salvatore_sechi/salvatore_sechi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../apis/api_client.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'year_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<PaymentCe> futurePaymentCe;
  String year = '2020';
  List<String> years = [
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010',
    '2009',
  ];

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  Future<void> refreshData() async {
    futurePaymentCe = ApiClient.apiClient.paymentCeApi(year).whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaymentCe>(
      future: futurePaymentCe,
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

  Widget getView(PaymentCe paymentCe) {
    return Container(
      decoration: BoxDecoration(
        gradient: kBackgroundGradient,
      ),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showAlertDialog(context, 'ENERGIA IN ACCONTO GSE',
                            'Energia in acconto pagata dal GSE per l\'aano selezionato');
                      },
                      child: buildItem('ENERGIA IN\nACCONTO GSE',
                          '${paymentCe.data.energyGse} kWh', ''),
                    ),
                    GestureDetector(
                      onTap: () {
                        showAlertDialog(context, 'ENERGIA REALE',
                            'Energia realmente prodotta nell\’anno selezionato.\nIn caso di 5° CONTO ENERGIA è necessario sottoscrivere il portale e-produtori per scaricare le misure reali mensili, in caso contrario il valore sarà zero');
                      },
                      child: buildItem('ENERGIA REALE',
                          '${paymentCe.data.realEnergy} kWh', ''),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showAlertDialog(context, 'CONGUAGLIO',
                            'Differenza tra il valore dell\’incentivo per l\’energia realmente prodotta nell\’anno selezionato e l\’incentivo pagato in acconto');
                      },
                      child: buildItem('CONGUAGLIO', '${paymentCe.data.rate} €',
                          'LIQUID IL:'),
                    ),
                    GestureDetector(
                      onTap: () {
                        showAlertDialog(context, 'INCENTIVI',
                            'Valore dell\’energia realmente prodotta nell\’anno selezionato');
                      },
                      child: buildItem(
                          'TOTALE PERCEPITO',
                          '${paymentCe.data.balance} €',
                          'TARIFFA: TPA->0.164\nTFO->0.234'),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: paymentCe.yearData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(10)),
                      child: Container(
                        height: SizeConfig.screenWidth * 0.50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${paymentCe.yearData[index].monthPayment}',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: 'Comfortaa',
                                  fontSize: getProportionateScreenWidth(20),
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenWidth(5),
                              ),
                              buildItem2(paymentCe.yearData[index]?.paymentDate.toString()??"",
                                  paymentCe.yearData[index]?.taxablePayment.toString()??""),
                              SizedBox(
                                height: getProportionateScreenWidth(10),
                              ),
                              buildItem2(paymentCe.yearData[index]?.paymentDate.toString()??"",
                                  paymentCe.yearData[index]?.taxablePayment.toString()??""),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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

  Widget buildItem(String title, String value, String subValue) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
      child: Container(
        height: SizeConfig.screenWidth * 0.25,
        width: SizeConfig.screenWidth * 0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(5)),
              child: SvgPicture.asset(
                'assets/images/tap.svg',
                height: getProportionateScreenWidth(30),
                color: kPrimaryColor,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: kText2Color,
                      fontSize: getProportionateScreenWidth(12),
                    ),
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20),
                    fontFamily: 'Comfortaa',
                  ),
                ),
                Text(
                  subValue,
                  style: TextStyle(
                    color: kText2Color,
                    fontSize: getProportionateScreenWidth(10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem2(String date, String payment) {
    return Container(
      height: SizeConfig.screenWidth * 0.15,
      decoration: BoxDecoration(
        color: Color(0xFFEBEBEB),
      ),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'T',
                  style: TextStyle(
                    color: kText2Color,
                    fontSize: getProportionateScreenWidth(10),
                  ),
                ),
                Text(
                  'P',
                  style: TextStyle(
                    color: kText2Color,
                    fontSize: getProportionateScreenWidth(10),
                  ),
                ),
                Text(
                  'A',
                  style: TextStyle(
                    color: kText2Color,
                    fontSize: getProportionateScreenWidth(10),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PAGATO',
                  style: TextStyle(
                    color: kText2Color,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: kText2Color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              color: kPrimaryColor.withOpacity(0.7),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(5),
                    horizontal: getProportionateScreenWidth(20)),
                child: Text(
                  '$payment €',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comfortaa',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  yearAlertDialog(BuildContext context) {
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
                      onTap: (){
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

  showAlertDialog(BuildContext context, String title, String content) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(
        content,
        style: TextStyle(
          fontFamily: 'Comfortaa',
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
