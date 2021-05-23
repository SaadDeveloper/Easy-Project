import 'package:easy/model/photo_voltaic.dart';
import 'components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MonitoredGseScreen extends StatefulWidget {
  Future<PhotoVoltaic> futurePhotoVoltaic;

  MonitoredGseScreen(this.futurePhotoVoltaic);

  @override
  _MonitoredGseScreenState createState() => _MonitoredGseScreenState();
}

class _MonitoredGseScreenState extends State<MonitoredGseScreen> {
  @override
  Widget build(BuildContext context) {
    return Body(widget.futurePhotoVoltaic);
  }
}
