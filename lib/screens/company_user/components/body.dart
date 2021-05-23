import 'package:easy/apis/api_client.dart';
import 'package:easy/components/pref_manager.dart';
import 'package:easy/components/progress_bar.dart';
import 'package:easy/components/t.dart';
import 'package:easy/model/registration_data.dart';
import 'package:easy/screens/company_user/components/company_user_form.dart';
import 'package:easy/screens/salvatore_sechi/salvatore_sechi_screen.dart';
import 'package:easy/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var formKey = GlobalKey<FormState>();

  var _registrationData = new RegistrationData(sectorId: 2);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: SafeArea(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            gradient: kBackgroundGradient,
          ),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            child: Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 12,
                  child: Container(
                    color: Colors.white,
                    width: SizeConfig.screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: getProportionateScreenWidth(10),
                        ),
                        Text(
                          'CREATE A FREE\nACCOUNT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: 'Open Sans',
                            fontSize: getProportionateScreenWidth(35),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(15)),
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  CompanyUserForm(formKey: formKey, registrationData: _registrationData),
                                  SizedBox(
                                    height: getProportionateScreenWidth(20),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        validate();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: kPrimaryColor,
                                      ),
                                      child: Text(
                                        'PROCEED',
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize:
                                              getProportionateScreenWidth(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenWidth(2),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showAlertDialog(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: kDangerColor,
                                      ),
                                      child: Text(
                                        'RESTORE',
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize:
                                              getProportionateScreenWidth(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validate(){
    if(formKey.currentState.validate()){
      ProgressBar.indicator.show(context);
      ApiClient.apiClient.registrationApi(_registrationData).then((value){
        ProgressBar.indicator.hide();
        if (value != null && value.badge != null) {
          PrefManager.setBadge(value.badge);
          T.message('Registration successfully');
          Navigator.pushNamed(context, SalvatoreSechiScreen.routeName);
        } else if(value.username == 1 || value.email == 1){
          T.message("email and username already registered");
        } else{
          T.message("Server error");
        }
      });
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancel = FlatButton(
      child: Text(
        "ANNULLA",
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
        "SI",
        style: TextStyle(
          color: kPrimaryColor,
          fontFamily: 'Comfortaa',
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, WelcomeScreen.routeName);
      },
    );
    AlertDialog alert = AlertDialog(
      content: Text(
        'Sicuro do voler ripristinare\nquesto form?',
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
