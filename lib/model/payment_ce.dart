class PaymentCe {
  PaymentCe({
    this.years,
    this.data,
    this.yearData,
  });

  String years;
  Data data;
  List<YearDatum> yearData;

  factory PaymentCe.fromJson(Map<String, dynamic> json) => PaymentCe(
        years: json["years"] == null ? null : json["years"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        yearData: json["year_data"] == null
            ? null
            : List<YearDatum>.from(
                json["year_data"].map((x) => YearDatum.fromJson(x))),
      );
}

class Data {
  Data({
    this.energyGse,
    this.realEnergy,
    this.balance,
    this.adjustmentDate,
    this.incentives,
    this.rate,
  });

  int energyGse;
  int realEnergy;
  double balance;
  String adjustmentDate;
  double incentives;
  double rate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        energyGse: json["energy_gse"] == null ? null : json["energy_gse"],
        realEnergy: json["real_energy"] == null ? null : json["real_energy"],
        balance: json["balance"] == null ? null : json["balance"].toDouble(),
        adjustmentDate:
            json["adjustment_date"] == null ? null : json["adjustment_date"],
        incentives:
            json["incentives"] == null ? null : json["incentives"].toDouble(),
        rate: json["rate"] == null ? null : json["rate"].toDouble(),
      );
}

class YearDatum {
  YearDatum({
    this.monthPayment,
    this.paymentDate,
    this.taxablePayment,
  });

  String monthPayment;
  String paymentDate;
  double taxablePayment;

  factory YearDatum.fromJson(Map<String, dynamic> json) => YearDatum(
        monthPayment:
            json["month_payment"] == null ? null : json["month_payment"],
        paymentDate: json["payment_date"] == null ? null : json["payment_date"],
        taxablePayment: json["taxable_payment"] == null
            ? null
            : json["taxable_payment"].toDouble(),
      );
}
