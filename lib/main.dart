import 'package:easy/components/my_splash_screen.dart';
import 'package:easy/screens/data_sheet/data_sheet_screen.dart';
import 'package:easy/screens/plant_detail/plant_detail_screen.dart';
import 'package:easy/screens/prac/practice_screen.dart';
import 'package:easy/screens/salvatore_sechi/salvatore_sechi_screen.dart';
import 'package:easy/screens/welcome/welcome_screen.dart';
import 'package:easy/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy App',
      theme: theme(),
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
