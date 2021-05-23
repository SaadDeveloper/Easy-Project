class StatisticsYear {
  StatisticsYear({
    this.years,
    this.energyDrawn,
    this.energyInjected,
    this.energyProduced,
    this.selfConsumption,
    this.sspIndex,
    this.selfConsumedEnergy,
    this.accumulationEnergyNeeded,
    this.accumulationEnergyInstallable,
    this.powerPlant,
    this.billSaving,
    this.differentialSsp,
    this.cashAccumulation,
  });

  String years;
  double energyDrawn;
  double energyInjected;
  double energyProduced;
  double selfConsumption;
  double sspIndex;
  double selfConsumedEnergy;
  double accumulationEnergyNeeded;
  double accumulationEnergyInstallable;
  double powerPlant;
  double billSaving;
  double differentialSsp;
  double cashAccumulation;

  factory StatisticsYear.fromJson(Map<String, dynamic> json) => StatisticsYear(
        years: json["years"] == null ? null : json["years"],
        energyDrawn: json["energy_drawn"] == null
            ? null
            : json["energy_drawn"].toDouble(),
        energyInjected: json["energy_injected"] == null
            ? null
            : json["energy_injected"].toDouble(),
        energyProduced: json["energy_produced"] == null
            ? null
            : json["energy_produced"].toDouble(),
        selfConsumption: json["self_consumption"] == null
            ? null
            : json["self_consumption"].toDouble(),
        sspIndex:
            json["ssp_index"] == null ? null : json["ssp_index"].toDouble(),
        selfConsumedEnergy: json["self_consumed_energy"] == null
            ? null
            : json["self_consumed_energy"].toDouble(),
        accumulationEnergyNeeded: json["accumulation_energy_needed"] == null
            ? null
            : json["accumulation_energy_needed"].toDouble(),
        accumulationEnergyInstallable:
            json["accumulation_energy_installable"] == null
                ? null
                : json["accumulation_energy_installable"].toDouble(),
        powerPlant:
            json["power_plant"] == null ? null : json["power_plant"].toDouble(),
        billSaving:
            json["bill_saving"] == null ? null : json["bill_saving"].toDouble(),
        differentialSsp: json["differential_ssp"] == null
            ? null
            : json["differential_ssp"].toDouble(),
        cashAccumulation: json["cash_accumulation"] == null
            ? null
            : json["cash_accumulation"].toDouble(),
      );
}
