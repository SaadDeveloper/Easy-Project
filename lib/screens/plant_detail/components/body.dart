import 'package:easy/screens/data_sheet/data_sheet_screen.dart';
import 'package:easy/screens/energy_flow/energy_flow_screen.dart';
import 'package:easy/screens/payments/payment_screen.dart';
import 'package:easy/screens/statistics/statistics_screen.dart';
import 'package:easy/model/data_form.dart';
import 'package:easy/apis/api_client.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<DataForm> futureDataForm;

  @override
  void initState() {
    super.initState();
    futureDataForm = ApiClient.apiClient.plantDetailApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TabBarView(
        children: [
          StatisticsScreen(),
          EnergyFlowScreen(),
          PaymentScreen(),
          DataSheetScreen(futureDataForm),
        ],
      ),
    );
  }
}
