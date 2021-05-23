import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static String USER_NAME = "username";
  static String PASSWORD = "password";
  static String BADGE = "badge";
  static String PV_ID = "pvId";
  static String ENERGY_ACCOUNT = "EnergyAccount";

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static setUserName(String cookie) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_NAME, cookie);
  }

  static Future<String> getUserName() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(USER_NAME) ?? "";
  }

  static setPassword(String cookie) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(PASSWORD, cookie);
  }

  static Future<String> getPassword() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(PASSWORD) ?? "";
  }

  static setBadge(String cookie) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(BADGE, cookie);
  }

  static Future<String> getBadge() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(BADGE) ?? "";
  }

  static setPvId(String cookie) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(PV_ID, cookie);
  }

  static Future<String> getPvId() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(PV_ID) ?? "";
  }

  static setEnergyAccount(String cookie) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(ENERGY_ACCOUNT, cookie);
  }

  static Future<String> getEnergyAccount() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(ENERGY_ACCOUNT) ?? "";
  }
}
