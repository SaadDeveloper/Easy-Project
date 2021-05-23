/// success : true
/// badge : "badge"
/// username : 0
/// email : 0

class RegistrationData {
  RegistrationData({
    bool success,
    String badge,
    int username,
    int email, int sectorId}){
    success = success;
    badge = badge;
    username = username;
    email = email;
    this.sectorId = sectorId;
  }

  int sectorId;
  String fiscalCode;
  String vatNumber;
  String companyName;
  String name;
  String surname;
  String inputEmail;

  bool success;
  String badge;
  int username;
  int email;



  RegistrationData.fromJson(dynamic json) {
    success = json["success"];
    badge = json["badge"];
    username = json["username"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = success;
    map["badge"] = badge;
    map["username"] = username;
    map["email"] = email;
    return map;
  }
}