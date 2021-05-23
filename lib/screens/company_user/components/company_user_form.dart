import 'package:easy/components/utils.dart';
import 'package:easy/model/registration_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CompanyUserForm extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  RegistrationData _registrationData = new RegistrationData();

  CompanyUserForm(
      {GlobalKey<FormState> formKey, RegistrationData registrationData}) {
    this.formKey = formKey;
    _registrationData = registrationData;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildVatNumberField(),
          buildCompanyNameField(),
          buildEmailField(),
          buildConfirmEmailField(),
        ],
      ),
    );
  }

  TextFormField buildVatNumberField() {
    return TextFormField(
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.name,
        validator: (value)
    {
      if (value.isEmpty) {
        return '* vat number';
      }
      return null;
    },
    onChanged: (value) => _registrationData.vatNumber = value.trim(),
    style: TextStyle(
    fontFamily: 'Comfortaa',
    ),
    decoration: InputDecoration(
    contentPadding:
    EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
    hintText: "VAT NUMBER",
    hintStyle: TextStyle(
    color: Colors.grey,
    ),
    )
    ,
    );
  }

  TextFormField buildCompanyNameField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value.isEmpty) {
          return '* company name';
        }
        return null;
      },
      onChanged: (value) => _registrationData.companyName = value.trim(),
      style: TextStyle(
        fontFamily: 'Comfortaa',
      ),
      decoration: InputDecoration(
        contentPadding:
        EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
        hintText: "COMPANY NAME",
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
        } else if (!Utils.isValidEmail(value)) {
          return '* invalid email';
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
        } else if (_registrationData.inputEmail != value) {
          return '* email is not matched';
        } else if (!Utils.isValidEmail(value)) {
          return '* invalid email';
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
