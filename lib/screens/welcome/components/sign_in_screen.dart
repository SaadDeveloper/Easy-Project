import 'package:easy/apis/api_client.dart';
import 'package:easy/components/pref_manager.dart';
import 'package:easy/components/progress_bar.dart';
import 'package:easy/components/t.dart';
import 'package:easy/constants.dart';
import 'package:easy/screens/salvatore_sechi/salvatore_sechi_screen.dart';
import 'package:easy/model/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';

import '../../../size_config.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var formKey = GlobalKey<FormState>();
  var signIn = SignIn();
  var nameController = TextEditingController();
  var passController = TextEditingController();

  bool rememberMe = false;
  bool obscureText = true;
  String name;
  String pass;

  @override
  void initState() {
    super.initState();
    getCredentials();
  }

  void getCredentials() async {
    name = await PrefManager.getUserName();
    pass = await PrefManager.getPassword();
    print('nn: $name pp: $pass');
    if (name.isNotEmpty && pass.isNotEmpty) {
      nameController.text = name;
      passController.text = pass;
      rememberMe = true;
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Center(
          child: Text(
            'WELCOME BACK!',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: getProportionateScreenWidth(25),
              fontFamily: 'Open Sans',
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'USERNAME',
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: getProportionateScreenWidth(15),
                  fontFamily: 'Open Sans',
                ),
              ),
              buildNameField(),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Text(
                'PASSWORD',
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: getProportionateScreenWidth(15),
                  fontFamily: 'Open Sans',
                ),
              ),
              buildPasswordField(),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: onRememberMeChanged,
              activeColor: kPrimaryColor,
            ),
            Text(
              'STORE CREDENTIALS',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: getProportionateScreenWidth(13),
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              validationAndSignIn();
            },
            style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
            ),
            child: Text(
              'SIGN IN',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: getProportionateScreenWidth(20),
              ),
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(10),
        ),
        Text(
          'FORGOT YOUR CREDENTIALS?',
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'Open Sans',
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      controller: nameController,
      onSaved: (value) => signIn.username = value.toString(),
      validator: (value) {
        if (value.isEmpty) {
          return '* username';
        }
        return null;
      },
      cursorColor: kPrimaryColor,
      style: TextStyle(
        fontFamily: 'Comfortaa',
      ),
      decoration: InputDecoration(
        fillColor: Color(0xFFE8F0FE),
        filled: true,
        contentPadding:
            EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: passController,
      onSaved: (value) => signIn.password = value.toString(),
      validator: (value) {
        if (value.isEmpty) {
          return '* password';
        }
        return null;
      },
      cursorColor: kPrimaryColor,
      obscureText: obscureText,
      style: TextStyle(
        fontFamily: 'Comfortaa',
      ),
      decoration: InputDecoration(
        fillColor: Color(0xFFE8F0FE),
        filled: true,
        contentPadding:
            EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(
            obscureText ? LineIcons.eyeSlash : LineIcons.eye,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }

  void onRememberMeChanged(bool value) {
    print(
        '${nameController.text.toString()} ${nameController.text.toString()}');
    setState(() {
      rememberMe = value;
      if (rememberMe) {
        if (nameController.text.toString().isNotEmpty &&
            passController.text.toString().isNotEmpty) {
          // print('iii');
          PrefManager.setUserName(nameController.text.toString());
          PrefManager.setPassword(passController.text.toString());
        }
      } else {
        // print('eee');
        PrefManager.setUserName("");
        PrefManager.setPassword("");
      }
    });
  }

  void validationAndSignIn() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      ProgressBar.indicator.show(context);
      ApiClient.apiClient.signInApi(signIn).then((value) {
        if (value != null && value.badge != null) {
          ProgressBar.indicator.hide();
          PrefManager.setBadge(value.badge);
          T.message('Login successfully');
          Navigator.pushNamed(context, SalvatoreSechiScreen.routeName);
        } else {
          T.message('Invalid username or password');
        }
      }).catchError((e) {
        ProgressBar.indicator.hide();
        T.message(e.toString());
      }).whenComplete(() {
        ProgressBar.indicator.hide();
      });
    }
  }
}
