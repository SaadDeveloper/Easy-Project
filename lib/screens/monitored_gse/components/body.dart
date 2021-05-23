import 'package:easy/constants.dart';
import 'package:easy/model/photo_voltaic.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';

class Body extends StatefulWidget {
  Future<PhotoVoltaic> futurePhotoVoltaic;

  Body(this.futurePhotoVoltaic);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PhotoVoltaic>(
      future: widget.futurePhotoVoltaic,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data == null) {
          return emptyData('Data not found');
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          if(snapshot.data.pvGse.isNotEmpty) {
            return getView(snapshot.data);
          }else{
            return emptyData('Data not found');
          }
        } else if (snapshot.hasError) {
          return Text(snapshot.error);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget emptyData(String title) {
    return Container(
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              // fontSize: SizeConfig.safeBlockVertical * 3,
              ),
        ),
      ),
    );
  }

  Widget buildItem(String title, String value) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal :getProportionateScreenWidth(10)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(
                color: kPrimaryColor,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                color: kText2Color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getView(PhotoVoltaic photoVoltaic) {
    return Container(
      decoration: BoxDecoration(
        gradient: kBackgroundGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15)),
            child: Text(
              'Impianto fotovoltaico Sechi\nSalvatore Angelo - Cabras',
              style: TextStyle(
                color: kText2Color,
                fontSize: getProportionateScreenWidth(20),
                fontFamily: 'Comfortaa',
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          Icon(
            LineIcons.solarPanel,
            color: kPrimaryColor,
            size: SizeConfig.screenWidth * 0.15,
          ),
          Padding(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(5)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      buildItem('POD:', photoVoltaic.pvGse[0].pod),
                      buildItem('ADDRESS:', photoVoltaic.pvGse[0].pvAddress),
                      buildItem('ACCOUNT:', photoVoltaic.pvGse[0].energyAccount.toString()),
                      buildItem('CONVENTION:', photoVoltaic.pvGse[0].convention.toString()),
                      buildItem('STATE:', photoVoltaic.pvGse[0].state.toString()),
                      buildItem('PvDenomination:', photoVoltaic.pvGse[0].pvDenomination),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
