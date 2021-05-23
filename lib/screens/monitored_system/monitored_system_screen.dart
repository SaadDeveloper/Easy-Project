import 'package:easy/model/photo_voltaic.dart';
import 'components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MonitoredSystemScreen extends StatefulWidget {
  Future<PhotoVoltaic> futurePhotoVoltaic;

  MonitoredSystemScreen(this.futurePhotoVoltaic);

  @override
  _MonitoredSystemScreenState createState() => _MonitoredSystemScreenState();
}

class _MonitoredSystemScreenState extends State<MonitoredSystemScreen> {
  @override
  Widget build(BuildContext context) {
    return Body(widget.futurePhotoVoltaic);
  }
}
