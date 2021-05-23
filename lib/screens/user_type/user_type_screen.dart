import 'package:easy/screens/user_type/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../size_config.dart';

class UserTypeScreen extends StatelessWidget {
  static String routeName = "/user_type";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
