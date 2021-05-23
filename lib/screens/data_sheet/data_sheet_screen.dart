import 'package:easy/model/data_form.dart';
import 'package:easy/screens/data_sheet/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DataSheetScreen extends StatefulWidget {
  Future<DataForm> futureDataForm;

  DataSheetScreen(this.futureDataForm);
  @override
  _DataSheetScreenState createState() => _DataSheetScreenState();
}

class _DataSheetScreenState extends State<DataSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Body(widget.futureDataForm);
  }
}
