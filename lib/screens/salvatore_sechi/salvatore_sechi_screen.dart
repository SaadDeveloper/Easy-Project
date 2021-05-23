import 'package:easy/components/custom_nav_drawer.dart';
import 'package:easy/components/custom_pop_menu.dart';
import 'package:easy/screens/salvatore_sechi/components/body.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SalvatoreSechiScreen extends StatefulWidget {
  static String routeName = "/salvatore_sechi";

  @override
  _SalvatoreSechiScreenState createState() => _SalvatoreSechiScreenState();
}

class _SalvatoreSechiScreenState extends State<SalvatoreSechiScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'SALVATORE SECHI',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            CustomPopMenu(),
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor: Color(0xFFFFFFFF),
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                text: 'LIST OF MONITORED SYSTEMS',
              ),
              Tab(
                text: 'LIST OF MONITORED GSE',
              ),
            ],
          ),
        ),
        drawer: CustomNavDrawer(),
        body: Body(),
      ),
    );
  }
}
