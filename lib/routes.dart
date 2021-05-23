import 'package:easy/components/my_splash_screen.dart';
import 'package:easy/screens/account/account_screen.dart';
import 'package:easy/screens/plant_detail/plant_detail_screen.dart';
import 'package:easy/screens/prac/practice_screen.dart';
import 'package:easy/screens/services/services_screen.dart';

import 'screens/company_user/company_user_screen.dart';
import 'screens/private_user/private_user_screen.dart';
import 'screens/salvatore_sechi/salvatore_sechi_screen.dart';
import 'screens/user_type/user_type_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/services/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  UserTypeScreen.routeName: (context) => UserTypeScreen(),
  PrivateUserScreen.routeName: (context) => PrivateUserScreen(),
  CompanyUserScreen.routeName: (context) => CompanyUserScreen(),
  SalvatoreSechiScreen.routeName: (context) => SalvatoreSechiScreen(),
  PlantDetailScreen.routeName: (context) => PlantDetailScreen(),
  ServicesScreen.routeName: (context) => ServicesScreen(),
  MySplashScreen.routeName: (context) => MySplashScreen(),
  PracticeScreen.routeName: (context) => PracticeScreen(),
  AccountScreen.routeName: (context) => AccountScreen(),
};
