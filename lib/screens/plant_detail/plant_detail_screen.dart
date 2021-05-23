import 'package:easy/components/custom_nav_drawer.dart';
import 'package:easy/components/custom_pop_menu.dart';
import 'package:easy/screens/plant_detail/components/body.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlantDetailScreen extends StatelessWidget {
  static String routeName = "/plant_detail";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'SOLAR POOL',
            style: TextStyle(color: Colors.white),
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
                text: 'STATISTICS',
              ),
              Tab(
                text: 'ENERGY FLOWS',
              ),
              Tab(
                text: 'PAYMENTS',
              ),
              Tab(
                text: 'DATA SHEET',
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
