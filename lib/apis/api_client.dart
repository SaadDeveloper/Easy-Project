import 'dart:convert';
import 'dart:io';
import 'package:easy/components/pref_manager.dart';
import 'package:easy/model/data_form.dart';
import 'package:easy/model/global_data.dart';
import 'package:easy/model/payment_ce.dart';
import 'package:easy/model/photo_voltaic.dart';
import 'package:easy/model/registration_data.dart';
import 'package:easy/model/sign_in.dart';
import 'package:easy/model/statistics_year.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient._();

  static final ApiClient apiClient = ApiClient._();
  static final http.Client httpClient = http.Client();

  String badge;
  String pvId;
  String energyAccount;

  Future<void> getCredentials() async {
    badge = await PrefManager.getBadge();
    pvId = await PrefManager.getPvId();
    energyAccount = await PrefManager.getEnergyAccount();
  }

  Future<SignIn> signInApi(SignIn signIn) async {
    try {
      http.Response response = await http.post(
        'https://sosfer.com/sos_code/api/1.0/api.php/login?username=${signIn.username}&password=${signIn.password}',
      );
      // print('signIn: ${response.body}');
      if (response.body == '[]') {
        return null;
      } else {
        var parsed = jsonDecode(response.body);
        signIn = SignIn.fromJson(parsed);
        return signIn;
      }
    } on SocketException {
      return Future.error('Check your internet connection');
    } on http.ClientException {
      return Future.error('Check your internet connection');
    } catch (e) {
      print(e.toString());
      return Future.error('Server error');
    }
  }

  Future<RegistrationData> registrationApi(RegistrationData data) async {
    try {
      http.Response response;
      if(data.sectorId == 1){
        response = await http.post(
          'https://sosfer.com/sos_code/api/1.0/api.php/new_customer?sector_id=${data.sectorId}&fiscal_code=${data.fiscalCode}&name=${data.name}'
              '&surname=${data.surname}&email=${data.inputEmail}&vat_number=&company_name='
        );
      }else{
        response = await http.post(
          'https://sosfer.com/sos_code/api/1.0/api.php/new_customer?sector_id=${data.sectorId}&fiscal_code=&name='
              '&surname=&email=${data.inputEmail}&vat_number=${data.vatNumber}&company_name=${data.companyName}'
        );
      }

      // print('signIn: ${response.body}');
      if (response.body == '[]') {
        return null;
      } else {
        var parsed = jsonDecode(response.body);
        data = RegistrationData.fromJson(parsed);
        return data;
      }
    } on SocketException {
      return Future.error('Check your internet connection');
    } on http.ClientException {
      return Future.error('Check your internet connection');
    } catch (e) {
      print(e.toString());
      return Future.error('Server error');
    }
  }

  Future<PhotoVoltaic> photoVoltaicApi() async {
    await getCredentials();
    try {
      http.Response response = await http.post(
        'https://sosfer.com/sos_code/api/1.0/api.php/pv_list?badge=$badge',
      );
      // print('photo voltaic: ${response.body}');
      if (response.body == '[]') {
        return null;
      } else {
        var parsed = jsonDecode(response.body);
        print(parsed.toString());
        return PhotoVoltaic.fromJson(parsed);
      }
    } on SocketException {
      return Future.error('Check your internet connection');
    } on http.ClientException {
      return Future.error('Check your internet connection');
    } catch (e) {
      print(e.toString());
      return Future.error('Server error');
    }
  }

  Future<StatisticsYear> statisticsYearApi(String year) async {
    await getCredentials();
    try {
      http.Response response = await http.post(
        'https://sosfer.com/sos_code/api/1.0/api.php/statistics?badge=$badge&pv_id=$pvId&year=$year',
      );
      // print('statistics year: ${response.body}');
      if (response.body == '[]') {
        return null;
      } else {
        var parsed = jsonDecode(response.body);
        return StatisticsYear.fromJson(parsed);
      }
    } on SocketException {
      return Future.error('Check your internet connection');
    } on http.ClientException {
      return Future.error('Check your internet connection');
    } catch (e) {
      print(e.toString());
      return Future.error('Server error');
    }
  }

  Future<DataForm> plantDetailApi() async {
    await getCredentials();
    try {
      http.Response response = await http.post(
        'https://sosfer.com/sos_code/api/1.0/api.php/pv_card?badge=$badge&pv_id=$pvId',
      );
      // print('data sheet: ${response.body}');
      if (response.body == '[]') {
        return null;
      } else {
        var parsed = jsonDecode(response.body);
        return DataForm.fromJson(parsed);
      }
    } on SocketException {
      return Future.error('Check your internet connection');
    } on http.ClientException {
      return Future.error('Check your internet connection');
    } catch (e) {
      print(e.toString());
      return Future.error('Server error');
    }
  }

  Future<PaymentCe> paymentCeApi(String year) async {
    await getCredentials();
    try {
      http.Response response = await http.post(
        'https://sosfer.com/sos_code/api/1.0/api.php/payments_ce?badge=$badge&pv_id=$pvId&energy_account=$energyAccount&year=$year',
      );
      print('payment ce: ${response.body}');
      if (response.body == '[]') {
        return null;
      } else {
        var parsed = jsonDecode(response.body);
        for (Map<String, dynamic> user in parsed) {
          return PaymentCe.fromJson(user);
        }
      }
    } on SocketException {
      return Future.error('Check your internet connection');
    } on http.ClientException {
      return Future.error('Check your internet connection');
    } catch (e) {
      print(e.toString());
      return Future.error('Server error');
    }
  }

  Future<PaymentCe> getServicesApi(String year) async {
    await getCredentials();
    try {
      http.Response response = await http.post(
        'https://sosfer.com/sos_code/api/1.0/api.php/payments_ce?badge=$badge&pv_id=$pvId&energy_account=$energyAccount&year=$year',
      );
      print('payment ce: ${response.body}');
      if (response.body == '[]') {
        return null;
      } else {
        var parsed = jsonDecode(response.body);
        for (Map<String, dynamic> user in parsed) {
          return PaymentCe.fromJson(user);
        }
      }
    } on SocketException {
      return Future.error('Check your internet connection');
    } on http.ClientException {
      return Future.error('Check your internet connection');
    } catch (e) {
      print(e.toString());
      return Future.error('Server error');
    }
  }
}
