import 'package:easy/apis/api_client.dart';
import 'package:easy/screens/monitored_gse/monitored_gse_screen.dart';
import 'package:easy/screens/monitored_system/monitored_system_screen.dart';
import 'package:easy/model/photo_voltaic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<PhotoVoltaic> futurePhotoVoltaic;

  @override
  void initState() {
    super.initState();

    futurePhotoVoltaic = ApiClient.apiClient.photoVoltaicApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TabBarView(
        children: [
          MonitoredSystemScreen(futurePhotoVoltaic),
          MonitoredGseScreen(futurePhotoVoltaic),
        ],
      ),
    );
  }
}
