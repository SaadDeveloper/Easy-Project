import 'package:easy/constants.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:line_icons/line_icons.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          Container(
            child: Text(
              'Invio tramite sms e/o e-mail di comunicazioni informative e promozionali, nonché newsletter da parte di SOSFER SRLS in relazione alle proprie iniziative',
              style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: getProportionateScreenWidth(18)),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          FlutterSwitch(
            value: status,
            showOnOff: true,
            activeColor: kPrimaryColor,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          SizedBox(
            width: SizeConfig.screenWidth,
            child: ElevatedButton(
              onPressed: () {
                showAlertDialog(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFD6D7D7),
              ),
              child: Text(
                'CANCELLA ACCOUNT',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: getProportionateScreenWidth(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancel = FlatButton(
      child: Text(
        "CANCEL",
        style: TextStyle(
          color: kPrimaryColor,
          fontFamily: 'Comfortaa',
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget yes = FlatButton(
      child: Text(
        "OK",
        style: TextStyle(
          color: kPrimaryColor,
          fontFamily: 'Comfortaa',
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text('CANCELLAZIONE ACCOUNT'),
      content: Text(
        'Questa procedura eliminera definitivamente tutti i tuii dati dal nostro server, vuoi procedere?',
        style: TextStyle(
          fontFamily: 'Comfortaa',
        ),
      ),
      actions: [
        cancel,
        yes,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
