import 'package:easy/screens/company_user/components/body.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CompanyUserScreen extends StatelessWidget {
  static String routeName = "/company_user";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
