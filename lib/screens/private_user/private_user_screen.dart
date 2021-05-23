import 'package:easy/screens/private_user/components/body.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PrivateUserScreen extends StatelessWidget {
  static String routeName = "/private_user";


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
