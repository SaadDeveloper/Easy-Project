import 'package:easy/components/utils.dart';
import 'package:easy/constants.dart';
import 'package:easy/model/global_data.dart';
import 'package:easy/model/registration_data.dart';
import 'package:easy/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PrivateUserForm extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  RegistrationData _registrationData = new RegistrationData();

  PrivateUserForm({GlobalKey<FormState> formKey, RegistrationData registrationData}) {
    this.formKey = formKey;
    _registrationData = registrationData;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildFiscalCodeField(),
          buildNameField(),
          buildSurNameField(),
          buildEmailField(),
          buildConfirmEmailField(),
        ],
      ),
    );
  }

  TextFormField buildFiscalCodeField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      validator: (value) {
        if (value.isEmpty) {
          return '* fiscal code';
        }
        return Utils.validate(value);
      },
      onChanged: (value) => _registrationData.fiscalCode = value.trim(),
      style: TextStyle(
        fontFamily: 'Comfortaa',
      ),
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
          hintText: "FISCAL CODE",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
      ),
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value.isEmpty) {
          return '* name';
        }
        return null;
      },
      onChanged: (value) => _registrationData.name = value.trim(),
      style: TextStyle(
        fontFamily: 'Comfortaa',
      ),
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
          hintText: "NAME",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
      ),
    );
  }

  TextFormField buildSurNameField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value.isEmpty) {
          return '* sure name';
        }
        return null;
      },
      onChanged: (value) => _registrationData.surname = value.trim(),
      style: TextStyle(
        fontFamily: 'Comfortaa',
      ),
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
          hintText: "SURE NAME",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          return '* email';
        }
        return null;
      },
      onChanged: (value) => _registrationData.inputEmail = value.trim(),
      style: TextStyle(
        fontFamily: 'Comfortaa',
      ),
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
          hintText: "EMAIL",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
      ),
    );
  }

  TextFormField buildConfirmEmailField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          return '* confirm email';
        }else if(_registrationData.inputEmail !=  value){
          return '* email is not matched';
        }
        return null;
      },
      style: TextStyle(
        fontFamily: 'Comfortaa',
      ),
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
          hintText: "CONFIRM EMAIL",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
      ),
    );
  }
}
