import 'package:easy/model/photo_voltaic.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants.dart';

class SubscriptionPreviewDialog extends StatefulWidget {
  PvProcessed pvProcessed;

  SubscriptionPreviewDialog(this.pvProcessed, {Key key}) : super(key: key);

  @override
  _SubscriptionPreviewDialogState createState() =>
      _SubscriptionPreviewDialogState();
}

class _SubscriptionPreviewDialogState extends State<SubscriptionPreviewDialog> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: getProportionateScreenHeight(50),
                      width: getProportionateScreenWidth(50),
                      child: Image(
                        image: AssetImage("assets/images/box.png"),
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Expanded(
                    flex: 4,
                    child: Column(
                      /**/
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Active Service",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(15),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          widget.pvProcessed.serviceName,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(20),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Stipulate",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          widget.pvProcessed.stipulationDate,
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: getProportionateScreenWidth(13),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(5)),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Deadline",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          widget.pvProcessed.expirationDate,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TECHNICAL ASSISTANCE",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(13),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.normal),
                  ),
                  getAssistanceTextView(widget.pvProcessed)
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "The service will expire in",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(13),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    widget.pvProcessed.remainingDays.toString() + " days",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(13),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.normal),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget getAssistanceTextView(PvProcessed pvProcessed){
    List<int> list = [1, 2, 3, 4];
    if(list.contains(pvProcessed.serviceId) && pvProcessed.remainingDays >= 0){
      return Text(
        "ACTIVE",
        style: TextStyle(
            fontSize: getProportionateScreenWidth(13),
            fontFamily: 'Comfortaa',
            color: kPrimaryColor,
            fontWeight: FontWeight.normal),
      );
    }else{
      return Text(
        "NON ACTIVE",
        style: TextStyle(
            fontSize: getProportionateScreenWidth(13),
            fontFamily: 'Comfortaa',
            color: kDangerColor,
            fontWeight: FontWeight.normal),
      );
    }
  }
}
