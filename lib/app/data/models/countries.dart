import "dart:convert";

Countries countriesFromJSON(String str) => Countries.fromJSON(json.decode(str));

class Countries {
  late List<Country> countries;

  Countries({
    this.countries = const <Country>[],
  });

  factory Countries.fromJSON(Map<String, dynamic> json) {
    return Countries(
      countries: json["countries"] == null ? <Country>[] : List<Country>.from(json["countries"]!.map((x) => Country.fromJSON(x))),
    );
  }
}

class Country {
  late int? id;
  late String? idZone;
  late String? idCurrency;
  late String? callPrefix;
  late String? isoCode;
  late String? active;
  late String? containsStates;
  late String? needIdentificationNumber;
  late String? needZipCode;
  late String? zipCodeFormat;
  late String? displayTaxLabel;
  late String? name;

  Country({
    this.id,
    this.idZone,
    this.idCurrency,
    this.callPrefix,
    this.isoCode,
    this.active,
    this.containsStates,
    this.needIdentificationNumber,
    this.needZipCode,
    this.zipCodeFormat,
    this.displayTaxLabel,
    this.name,
  });

  factory Country.fromJSON(Map<String, dynamic> json) {
    return Country(
      id: json["id"],
      idZone: json["id_zone"],
      idCurrency: json["id_currency"],
      callPrefix: json["call_prefix"],
      isoCode: json["iso_code"],
      active: json["active"],
      containsStates: json["contains_states"],
      needIdentificationNumber: json["need_identification_number"],
      needZipCode: json["need_zip_code"],
      zipCodeFormat: json["zip_code_format"],
      displayTaxLabel: json["display_tax_label"],
      name: json["name"],
    );
  }
}
