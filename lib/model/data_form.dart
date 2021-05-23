// class DataForm {
//   DataForm({
//     this.dataSheet,
//     this.pvLocation,
//   });
//
//   List<DataSheet> dataSheet;
//   List<PvLocation> pvLocation;
//
//   factory DataForm.fromJson(Map<String, dynamic> json) => DataForm(
//         dataSheet: List<DataSheet>.from(
//             json["data_sheet"].map((x) => DataSheet.fromJson(x))),
//         pvLocation: List<PvLocation>.from(
//             json["pv_location"].map((x) => PvLocation.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data_sheet": List<dynamic>.from(dataSheet.map((x) => x.toJson())),
//         "pv_location": List<dynamic>.from(pvLocation.map((x) => x.toJson())),
//       };
// }
//
// class DataSheet {
//   DataSheet({
//     this.pod,
//     this.denomination,
//     this.exerciseDate,
//     this.orientation,
//     this.inclination,
//     this.voltage,
//     this.power,
//     this.surface,
//     this.technologyModules,
//     this.moduleBrand,
//     this.modelModules,
//     this.numberModules,
//     this.powerModules,
//     this.inverterBrand,
//     this.inverterModel,
//     this.numberInverter,
//     this.region,
//     this.province,
//     this.municipality,
//     this.postalCode,
//     this.address,
//     this.civicNumber,
//   });
//
//   String pod;
//   String denomination;
//   String exerciseDate;
//   String orientation;
//   String inclination;
//   String voltage;
//   String power;
//   String surface;
//   String technologyModules;
//   String moduleBrand;
//   String modelModules;
//   String numberModules;
//   String powerModules;
//   String inverterBrand;
//   String inverterModel;
//   String numberInverter;
//   String region;
//   String province;
//   String municipality;
//   String postalCode;
//   String address;
//   String civicNumber;
//
//   factory DataSheet.fromJson(Map<String, dynamic> json) => DataSheet(
//         pod: json["pod"],
//         denomination: json["denomination"],
//         exerciseDate: json["exercise_date"],
//         orientation: json["orientation"],
//         inclination: json["inclination"],
//         voltage: json["voltage"],
//         power: json["power"],
//         surface: json["surface"],
//         technologyModules: json["technology_modules"],
//         moduleBrand: json["module_brand"],
//         modelModules: json["model_modules"],
//         numberModules: json["number_modules"],
//         powerModules: json["power_modules"],
//         inverterBrand: json["inverter_brand"],
//         inverterModel: json["inverter_model"],
//         numberInverter: json["number_inverter"],
//         region: json["region"],
//         province: json["province"],
//         municipality: json["municipality"],
//         postalCode: json["postal_code"],
//         address: json["address"],
//         civicNumber: json["civic_number"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "pod": pod,
//         "denomination": denomination,
//         "exercise_date": exerciseDate,
//         "orientation": orientation,
//         "inclination": inclination,
//         "voltage": voltage,
//         "power": power,
//         "surface": surface,
//         "technology_modules": technologyModules,
//         "module_brand": moduleBrand,
//         "model_modules": modelModules,
//         "number_modules": numberModules,
//         "power_modules": powerModules,
//         "inverter_brand": inverterBrand,
//         "inverter_model": inverterModel,
//         "number_inverter": numberInverter,
//         "region": region,
//         "province": province,
//         "municipality": municipality,
//         "postal_code": postalCode,
//         "address": address,
//         "civic_number": civicNumber,
//       };
// }
//
// class PvLocation {
//   PvLocation({
//     this.denomination,
//     this.power,
//     this.latitude,
//     this.longitude,
//   });
//
//   String denomination;
//   String power;
//   double latitude;
//   double longitude;
//
//   factory PvLocation.fromJson(Map<String, dynamic> json) => PvLocation(
//         denomination: json["denomination"],
//         power: json["power"],
//         latitude: json["latitude"].toDouble(),
//         longitude: json["longitude"].toDouble(),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "denomination": denomination,
//         "power": power,
//         "latitude": latitude,
//         "longitude": longitude,
//       };
// }

class DataForm {
  DataForm({
    this.dataSheet,
    this.pvLocation,
  });

  List<DataSheet> dataSheet;
  List<PvLocation> pvLocation;

  factory DataForm.fromJson(Map<String, dynamic> json) => DataForm(
        dataSheet: json["data_sheet"] == null
            ? null
            : List<DataSheet>.from(
                json["data_sheet"].map((x) => DataSheet.fromJson(x))),
        pvLocation: json["pv_location"] == null
            ? null
            : List<PvLocation>.from(
                json["pv_location"].map((x) => PvLocation.fromJson(x))),
      );
}

class DataSheet {
  DataSheet({
    this.pod,
    this.denomination,
    this.exerciseDate,
    this.orientation,
    this.inclination,
    this.voltage,
    this.power,
    this.surface,
    this.technologyModules,
    this.moduleBrand,
    this.modelModules,
    this.numberModules,
    this.powerModules,
    this.inverterBrand,
    this.inverterModel,
    this.numberInverter,
    this.region,
    this.province,
    this.municipality,
    this.postalCode,
    this.address,
    this.civicNumber,
  });

  String pod;
  String denomination;
  String exerciseDate;
  int orientation;
  int inclination;
  int voltage;
  double power;
  double surface;
  String technologyModules;
  String moduleBrand;
  String modelModules;
  int numberModules;
  int powerModules;
  String inverterBrand;
  String inverterModel;
  int numberInverter;
  String region;
  String province;
  String municipality;
  int postalCode;
  String address;
  int civicNumber;

  factory DataSheet.fromJson(Map<String, dynamic> json) => DataSheet(
        pod: json["pod"] == null ? null : json["pod"],
        denomination:
            json["denomination"] == null ? null : json["denomination"],
        exerciseDate:
            json["exercise_date"] == null ? null : json["exercise_date"],
        orientation: json["orientation"] == null ? null : json["orientation"],
        inclination: json["inclination"] == null ? null : json["inclination"],
        voltage: json["voltage"] == null ? null : json["voltage"],
        power: json["power"] == null ? null : json["power"].toDouble(),
        surface: json["surface"] == null ? null : json["surface"].toDouble(),
        technologyModules: json["technology_modules"] == null
            ? null
            : json["technology_modules"],
        moduleBrand: json["module_brand"] == null ? null : json["module_brand"],
        modelModules:
            json["model_modules"] == null ? null : json["model_modules"],
        numberModules:
            json["number_modules"] == null ? null : json["number_modules"],
        powerModules:
            json["power_modules"] == null ? null : json["power_modules"],
        inverterBrand:
            json["inverter_brand"] == null ? null : json["inverter_brand"],
        inverterModel:
            json["inverter_model"] == null ? null : json["inverter_model"],
        numberInverter:
            json["number_inverter"] == null ? null : json["number_inverter"],
        region: json["region"] == null ? null : json["region"],
        province: json["province"] == null ? null : json["province"],
        municipality:
            json["municipality"] == null ? null : json["municipality"],
        postalCode: json["postal_code"] == null ? null : json["postal_code"],
        address: json["address"] == null ? null : json["address"],
        civicNumber: json["civic_number"] == null ? null : json["civic_number"],
      );
}

class PvLocation {
  PvLocation({
    this.denomination,
    this.power,
    this.latitude,
    this.longitude,
  });

  String denomination;
  double power;
  double latitude;
  double longitude;

  factory PvLocation.fromJson(Map<String, dynamic> json) => PvLocation(
        denomination:
            json["denomination"] == null ? null : json["denomination"],
        power: json["power"] == null ? null : json["power"].toDouble(),
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
      );
}
