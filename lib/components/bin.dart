class Bin{
  // class PhotoVoltaic {
//   PhotoVoltaic({
//     this.client,
//     this.pvGse,
//     this.pvProcessed,
//   });
//
//   List<Client> client;
//   List<dynamic> pvGse;
//   List<PvProcessed> pvProcessed;
//
//   factory PhotoVoltaic.fromJson(Map<String, dynamic> json) => PhotoVoltaic(
//         client:
//             List<Client>.from(json["client"].map((x) => Client.fromJson(x))),
//         pvGse: List<dynamic>.from(json["pv_gse"].map((x) => x)),
//         pvProcessed: List<PvProcessed>.from(
//             json["pv_processed"].map((x) => PvProcessed.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "pv_gse": List<dynamic>.from(pvGse.map((x) => x)),
//       };
// }
//
// class Client {
//   Client({
//     this.clientId,
//     this.alertId,
//     this.fullName,
//     this.sectorId,
//     this.newsletter,
//     this.review,
//     this.name,
//     this.surname,
//     this.fiscalCode,
//     this.vatNumber,
//     this.phone1,
//     this.phone2,
//     this.municipality,
//     this.province,
//     this.region,
//     this.postalCode,
//     this.address,
//     this.civicNumber,
//   });
//
//   String clientId;
//   String alertId;
//   String fullName;
//   String sectorId;
//   String newsletter;
//   int review;
//   String name;
//   String surname;
//   String fiscalCode;
//   String vatNumber;
//   String phone1;
//   String phone2;
//   String municipality;
//   String province;
//   String region;
//   String postalCode;
//   String address;
//   String civicNumber;
//
//   factory Client.fromJson(Map<String, dynamic> json) => Client(
//         clientId: json["client_id"],
//         alertId: json["alert_id"],
//         fullName: json["full_name"],
//         sectorId: json["sector_id"],
//         newsletter: json["newsletter"],
//         review: json["review"],
//         name: json["name"],
//         surname: json["surname"],
//         fiscalCode: json["fiscal_code"],
//         vatNumber: json["vat_number"],
//         phone1: json["phone1"],
//         phone2: json["phone2"],
//         municipality: json["municipality"],
//         province: json["province"],
//         region: json["region"],
//         postalCode: json["postal_code"],
//         address: json["address"],
//         civicNumber: json["civic_number"],
//       );
// }
//
// class PvProcessed {
//   PvProcessed({
//     this.state,
//     this.sectorId,
//     this.clientId,
//     this.pvId,
//     this.power,
//     this.municipality,
//     this.denomination,
//     this.totalEnergy,
//     this.totalIncentives,
//     this.lastYear,
//     this.yieldYear,
//     this.lastMonth,
//     this.yieldMonth,
//     this.serviceId,
//     this.switchSub,
//     this.serviceName,
//     this.stipulationDate,
//     this.expirationDate,
//     this.remainingDays,
//     this.priceService,
//   });
//
//   int state;
//   String sectorId;
//   String clientId;
//   String pvId;
//   String power;
//   String municipality;
//   String denomination;
//   String totalEnergy;
//   String totalIncentives;
//   String lastYear;
//   String yieldYear;
//   String lastMonth;
//   String yieldMonth;
//   String serviceId;
//   int switchSub;
//   String serviceName;
//   String stipulationDate;
//   String expirationDate;
//   int remainingDays;
//   String priceService;
//
//   factory PvProcessed.fromJson(Map<String, dynamic> json) => PvProcessed(
//         state: json["state"],
//         sectorId: json["sector_id"],
//         clientId: json["client_id"],
//         pvId: json["pv_id"],
//         power: json["power"],
//         municipality: json["municipality"],
//         denomination: json["denomination"],
//         totalEnergy: json["total_energy"],
//         totalIncentives: json["total_incentives"],
//         lastYear: json["last_year"],
//         yieldYear: json["yield_year"],
//         lastMonth: json["last_month"],
//         yieldMonth: json["yield_month"],
//         serviceId: json["service_id"],
//         switchSub: json["switch_sub"],
//         serviceName: json["service_name"],
//         stipulationDate: json["stipulation_date"],
//         expirationDate: json["expiration_date"],
//         remainingDays: json["remaining_days"],
//         priceService: json["price_service"],
//       );
// }

  // class DataForm {
//   DataForm({
//     this.statistics,
//     this.dateFormYield,
//     this.paymentsCe,
//     this.paymentsSsp,
//     this.activeConventions,
//     this.dataSheet,
//     this.pvLocation,
//   });
//
//   Statistics statistics;
//   List<Yield> dateFormYield;
//   List<PaymentsCe> paymentsCe;
//   dynamic paymentsSsp;
//   List<ActiveConvention> activeConventions;
//   List<DataSheet> dataSheet;
//   List<PvLocation> pvLocation;
//
//   factory DataForm.fromJson(Map<String, dynamic> json) => DataForm(
//         statistics: Statistics.fromJson(json["statistics"]),
//         dateFormYield:
//             List<Yield>.from(json["yield"].map((x) => Yield.fromJson(x))),
//         paymentsCe: List<PaymentsCe>.from(json["paymentsCE"].map((x) => PaymentsCe.fromJson(x))),
//         paymentsSsp: json["paymentsSSP"],
//         activeConventions: List<ActiveConvention>.from(
//             json["active_conventions"]
//                 .map((x) => ActiveConvention.fromJson(x))),
//         dataSheet: List<DataSheet>.from(
//             json["data_sheet"].map((x) => DataSheet.fromJson(x))),
//         pvLocation: List<PvLocation>.from(
//             json["pv_location"].map((x) => PvLocation.fromJson(x))),
//       );
// }
//
// class ActiveConvention {
//   ActiveConvention({
//     this.pvId,
//     this.energyAccount,
//     this.convention,
//     this.yearsCe,
//     this.yearsSsp,
//     this.updateCe,
//     this.updateSsp,
//     this.denomination,
//   });
//
//   int pvId;
//   String energyAccount;
//   String convention;
//   String yearsCe;
//   String yearsSsp;
//   String updateCe;
//   String updateSsp;
//   String denomination;
//
//   factory ActiveConvention.fromJson(Map<String, dynamic> json) =>
//       ActiveConvention(
//         pvId: json["pv_id"],
//         energyAccount: json["energy_account"],
//         convention: json["convention"],
//         yearsCe: json["years_ce"],
//         yearsSsp: json["years_ssp"],
//         updateCe: json["update_ce"],
//         updateSsp: json["update_ssp"],
//         denomination: json["denomination"],
//       );
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
// }
//
// class Yield {
//   Yield({
//     this.the2020,
//     this.years,
//   });
//
//   Yield2020 the2020;
//   String years;
//
//   factory Yield.fromJson(Map<String, dynamic> json) => Yield(
//         the2020: Yield2020.fromJson(json["2020"]),
//         years: json["years"],
//       );
// }
//
// class Yield2020 {
//   Yield2020({
//     this.months,
//     this.set0,
//     this.set1,
//     this.the2020Yield,
//     this.totalEnergy,
//   });
//
//   String months;
//   String set0;
//   String set1;
//   int the2020Yield;
//   int totalEnergy;
//
//   factory Yield2020.fromJson(Map<String, dynamic> json) => Yield2020(
//         months: json["months"],
//         set0: json["set0"],
//         set1: json["set1"],
//         the2020Yield: json["yield"],
//         totalEnergy: json["total_energy"],
//       );
// }
//
// class PaymentsCe {
//   PaymentsCe({
//     this.the2020,
//     this.years,
//     this.data,
//   });
//
//   List<Map<String, The2020Value>> the2020;
//   String years;
//   Data data;
//
//   factory PaymentsCe.fromJson(Map<String, dynamic> json) => PaymentsCe(
//         the2020: List<Map<String, The2020Value>>.from(json["2020"].map((x) =>
//             Map.from(x).map((k, v) =>
//                 MapEntry<String, The2020Value>(k, The2020Value.fromJson(v))))),
//         years: json["years"],
//         data: Data.fromJson(json["data"]),
//       );
// }
//
// class Data {
//   Data({
//     this.energyGse,
//     this.realEnergy,
//     this.balance,
//     this.adjustmentDate,
//     this.incentives,
//     this.rate,
//   });
//
//   int energyGse;
//   String realEnergy;
//   String balance;
//   String adjustmentDate;
//   String incentives;
//   String rate;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         energyGse: json["energy_gse"],
//         realEnergy: json["real_energy"],
//         balance: json["balance"],
//         adjustmentDate: json["adjustment_date"],
//         incentives: json["incentives"],
//         rate: json["rate"],
//       );
// }
//
// class The2020Value {
//   The2020Value({
//     this.monthPayment,
//     this.paymentDateTpa,
//     this.taxablePagamentoTpa,
//     this.tpaPaymentStatus,
//     this.paymentDateTfo,
//     this.taxablePaymentTfo,
//     this.tfoPaymentStatus,
//   });
//
//   String monthPayment;
//   String paymentDateTpa;
//   String taxablePagamentoTpa;
//   String tpaPaymentStatus;
//   String paymentDateTfo;
//   String taxablePaymentTfo;
//   String tfoPaymentStatus;
//
//   factory The2020Value.fromJson(Map<String, dynamic> json) => The2020Value(
//         monthPayment: json["month_payment"],
//         paymentDateTpa: json["payment_date_tpa"],
//         taxablePagamentoTpa: json["taxable_pagamento_tpa"],
//         tpaPaymentStatus: json["tpa_payment_status"],
//         paymentDateTfo: json["payment_date_tfo"],
//         taxablePaymentTfo: json["taxable_payment_tfo"],
//         tfoPaymentStatus: json["tfo_payment_status"],
//       );
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
// }
//
// class Statistics {
//   Statistics({
//     this.years,
//     this.energyDrawn,
//     this.energyInjected,
//     this.energyProduced,
//     this.selfConsumption,
//     this.sspIndex,
//     this.selfConsumedEnergy,
//     this.accumulationEnergyNeeded,
//     this.accumulationEnergyInstallable,
//     this.powerPlant,
//     this.billSaving,
//     this.differentialSsp,
//     this.cashAccumulation,
//   });
//
//   String years;
//   int energyDrawn;
//   int energyInjected;
//   int energyProduced;
//   String selfConsumption;
//   int sspIndex;
//   int selfConsumedEnergy;
//   int accumulationEnergyNeeded;
//   int accumulationEnergyInstallable;
//   int powerPlant;
//   int billSaving;
//   int differentialSsp;
//   int cashAccumulation;
//
//   factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
//         years: json["years"],
//         energyDrawn: json["energy_drawn"],
//         energyInjected: json["energy_injected"],
//         energyProduced: json["energy_produced"],
//         selfConsumption: json["self_consumption"],
//         sspIndex: json["ssp_index"],
//         selfConsumedEnergy: json["self_consumed_energy"],
//         accumulationEnergyNeeded: json["accumulation_energy_needed"],
//         accumulationEnergyInstallable: json["accumulation_energy_installable"],
//         powerPlant: json["power_plant"],
//         billSaving: json["bill_saving"],
//         differentialSsp: json["differential_ssp"],
//         cashAccumulation: json["cash_accumulation"],
//       );
// }

// class PhotoVoltaic {
//   PhotoVoltaic({
//     this.client,
//     this.pvGse,
//     this.pvProcessed,
//   });
//
//   List<Client> client;
//   List<PvGse> pvGse;
//   List<PvProcessed> pvProcessed;
//
//   factory PhotoVoltaic.fromJson(Map<String, dynamic> json) => PhotoVoltaic(
//         client:
//             List<Client>.from(json["client"].map((x) => Client.fromJson(x))),
//
//         pvGse: List<PvGse>.from(json["pv_gse"] == "[]" ? "" : json["pv_gse"].map((x) => PvGse.fromJson(x))),
//
//         pvProcessed: List<PvProcessed>.from(
//             json["pv_processed"].map((x) => PvProcessed.fromJson(x))),
//       );
// }
//
// class Client {
//   Client({
//     this.clientId,
//     this.alertId,
//     this.fullName,
//     this.sectorId,
//     this.newsletter,
//     this.review,
//     this.name,
//     this.surname,
//     this.fiscalCode,
//     this.vatNumber,
//     this.phone1,
//     this.phone2,
//     this.municipality,
//     this.province,
//     this.region,
//     this.postalCode,
//     this.address,
//     this.civicNumber,
//   });
//
//   String clientId;
//   int alertId;
//   String fullName;
//   String sectorId;
//   String newsletter;
//   int review;
//   String name;
//   String surname;
//   String fiscalCode;
//   String vatNumber;
//   String phone1;
//   String phone2;
//   String municipality;
//   String province;
//   String region;
//   String postalCode;
//   String address;
//   String civicNumber;
//
//   factory Client.fromJson(Map<String, dynamic> json) => Client(
//         clientId: json["client_id"],
//         alertId: json["alert_id"],
//         fullName: json["full_name"],
//         sectorId: json["sector_id"],
//         newsletter: json["newsletter"],
//         review: json["review"],
//         name: json["name"],
//         surname: json["surname"],
//         fiscalCode: json["fiscal_code"],
//         vatNumber: json["vat_number"],
//         phone1: json["phone1"],
//         phone2: json["phone2"],
//         municipality: json["municipality"],
//         province: json["province"],
//         region: json["region"],
//         postalCode: json["postal_code"],
//         address: json["address"],
//         civicNumber: json["civic_number"],
//       );
// }
//
// class PvGse {
//   PvGse({
//     this.pod,
//     this.pvDenomination,
//     this.pvAddress,
//     this.energyAccount,
//     this.convention,
//     this.state,
//   });
//
//   String pod;
//   String pvDenomination;
//   String pvAddress;
//   String energyAccount;
//   String convention;
//   int state;
//
//   factory PvGse.fromJson(Map<String, dynamic> json) => PvGse(
//         pod: json["pod"],
//         pvDenomination: json["pv_denomination"],
//         pvAddress: json["pv_address"],
//         energyAccount: json["energy_account"],
//         convention: json["convention"],
//         state: json["state"],
//       );
// }
//
// class PvProcessed {
//   PvProcessed({
//     this.state,
//     this.sectorId,
//     this.clientId,
//     this.pvId,
//     this.power,
//     this.municipality,
//     this.denomination,
//     this.totalEnergy,
//     this.totalIncentives,
//     this.lastYear,
//     this.yieldYear,
//     this.lastMonth,
//     this.yieldMonth,
//     this.serviceId,
//     this.switchSub,
//     this.serviceName,
//     this.stipulationDate,
//     this.expirationDate,
//     this.remainingDays,
//     this.priceService,
//   });
//
//   int state;
//   String sectorId;
//   String clientId;
//   String pvId;
//   String power;
//   String municipality;
//   String denomination;
//   String totalEnergy;
//   String totalIncentives;
//   String lastYear;
//   String yieldYear;
//   String lastMonth;
//   String yieldMonth;
//   String serviceId;
//   int switchSub;
//   String serviceName;
//   String stipulationDate;
//   String expirationDate;
//   int remainingDays;
//   String priceService;
//
//   factory PvProcessed.fromJson(Map<String, dynamic> json) => PvProcessed(
//         state: json["state"],
//         sectorId: json["sector_id"],
//         clientId: json["client_id"],
//         pvId: json["pv_id"],
//         power: json["power"],
//         municipality: json["municipality"],
//         denomination: json["denomination"],
//         totalEnergy: json["total_energy"],
//         totalIncentives: json["total_incentives"],
//         lastYear: json["last_year"],
//         yieldYear: json["yield_year"],
//         lastMonth: json["last_month"],
//         yieldMonth: json["yield_month"],
//         serviceId: json["service_id"],
//         switchSub: json["switch_sub"],
//         serviceName: json["service_name"],
//         stipulationDate: json["stipulation_date"],
//         expirationDate: json["expiration_date"],
//         remainingDays: json["remaining_days"],
//         priceService: json["price_service"],
//       );
// }
}