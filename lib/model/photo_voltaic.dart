class PhotoVoltaic {
  PhotoVoltaic({
    this.client,
    this.pvGse,
    this.pvProcessed,
  });

  List<Client> client;
  List<PvGse> pvGse;
  List<PvProcessed> pvProcessed;

  factory PhotoVoltaic.fromJson(Map<String, dynamic> json) => PhotoVoltaic(
        client: json["client"] == null
            ? null
            : List<Client>.from(json["client"].map((x) => Client.fromJson(x))),
        pvGse: json["pv_gse"] == null
            ? null
            : List<PvGse>.from(json["pv_gse"].map((x) => PvGse.fromJson(x))),
        pvProcessed: json["pv_processed"] == null
            ? null
            : List<PvProcessed>.from(
                json["pv_processed"].map((x) => PvProcessed.fromJson(x))),
      );
}

class Client {
  Client({
    this.clientId,
    this.alertId,
    this.fullName,
    this.sectorId,
    this.newsletter,
    this.review,
    this.name,
    this.surname,
    this.fiscalCode,
    this.vatNumber,
    this.phone1,
    this.phone2,
    this.municipality,
    this.province,
    this.region,
    this.postalCode,
    this.address,
    this.civicNumber,
  });

  int clientId;
  int alertId;
  String fullName;
  int sectorId;
  int newsletter;
  int review;
  String name;
  String surname;
  String fiscalCode;
  String vatNumber;
  dynamic phone1;
  String phone2;
  String municipality;
  String province;
  String region;
  dynamic postalCode;
  String address;
  dynamic civicNumber;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        clientId: json["client_id"] == null ? null : json["client_id"],
        alertId: json["alert_id"] == null ? null : json["alert_id"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        sectorId: json["sector_id"] == null ? null : json["sector_id"],
        newsletter: json["newsletter"] == null ? null : json["newsletter"],
        review: json["review"] == null ? null : json["review"],
        name: json["name"] == null ? null : json["name"],
        surname: json["surname"] == null ? null : json["surname"],
        fiscalCode: json["fiscal_code"] == null ? null : json["fiscal_code"],
        vatNumber: json["vat_number"] == null ? null : json["vat_number"],
        phone1: json["phone1"] == null ? null : json["phone1"],
        phone2: json["phone2"] == null ? null : json["phone2"],
        municipality:
            json["municipality"] == null ? null : json["municipality"],
        province: json["province"] == null ? null : json["province"],
        region: json["region"] == null ? null : json["region"],
        postalCode: json["postal_code"] == null ? null : json["postal_code"],
        address: json["address"] == null ? null : json["address"],
        civicNumber: json["civic_number"] == null ? null : json["civic_number"],
      );
}

class PvGse {
  PvGse({
    this.pod,
    this.pvDenomination,
    this.pvAddress,
    this.energyAccount,
    this.convention,
    this.state,
  });

  String pod;
  String pvDenomination;
  String pvAddress;
  int energyAccount;
  int convention;
  int state;

  factory PvGse.fromJson(Map<String, dynamic> json) => PvGse(
        pod: json["pod"] == null ? null : json["pod"],
        pvDenomination:
            json["pv_denomination"] == null ? null : json["pv_denomination"],
        pvAddress: json["pv_address"] == null ? null : json["pv_address"],
        energyAccount:
            json["energy_account"] == null ? null : json["energy_account"],
        convention: json["convention"] == null ? null : json["convention"],
        state: json["state"] == null ? null : json["state"],
      );
}

class PvProcessed {
  PvProcessed({
    this.state,
    this.sectorId,
    this.clientId,
    this.pvId,
    this.power,
    this.municipality,
    this.denomination,
    this.totalEnergy,
    this.totalIncentives,
    this.lastYear,
    this.yieldYear,
    this.lastMonth,
    this.yieldMonth,
    this.serviceId,
    this.switchSub,
    this.serviceName,
    this.stipulationDate,
    this.expirationDate,
    this.remainingDays,
    this.priceService,
  });

  int state;
  int sectorId;
  int clientId;
  int pvId;
  double power;
  String municipality;
  String denomination;
  int totalEnergy;
  double totalIncentives;
  String lastYear;
  double yieldYear;
  String lastMonth;
  double yieldMonth;
  int serviceId;
  int switchSub;
  String serviceName;
  String stipulationDate;
  String expirationDate;
  int remainingDays;
  int priceService;

  factory PvProcessed.fromJson(Map<String, dynamic> json) => PvProcessed(
        state: json["state"] == null ? null : json["state"],
        sectorId: json["sector_id"] == null ? null : json["sector_id"],
        clientId: json["client_id"] == null ? null : json["client_id"],
        pvId: json["pv_id"] == null ? null : json["pv_id"],
        power: json["power"] == null ? null : json["power"].toDouble(),
        municipality:
            json["municipality"] == null ? null : json["municipality"],
        denomination:
            json["denomination"] == null ? null : json["denomination"],
        totalEnergy: json["total_energy"] == null ? null : json["total_energy"],
        totalIncentives: json["total_incentives"] == null
            ? null
            : json["total_incentives"].toDouble(),
        lastYear: json["last_year"] == null ? null : json["last_year"],
        yieldYear: json["yield_year"] == null ? null : json["yield_year"].toDouble(),
        lastMonth: json["last_month"] == null ? null : json["last_month"],
        yieldMonth: json["yield_month"] == null ? null : json["yield_month"].toDouble(),
        serviceId: json["service_id"] == null ? null : json["service_id"],
        switchSub: json["switch_sub"] == null ? null : json["switch_sub"],
        serviceName: json["service_name"] == null ? null : json["service_name"],
        stipulationDate:
            json["stipulation_date"] == null ? null : json["stipulation_date"],
        expirationDate:
            json["expiration_date"] == null ? null : json["expiration_date"],
        remainingDays:
            json["remaining_days"] == null ? null : json["remaining_days"],
        priceService:
            json["price_service"] == null ? null : json["price_service"],
      );
}
