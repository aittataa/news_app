import "dart:convert";

Regions regionsFromJson(String str) => Regions.fromJSON(json.decode(str));

class Regions {
  late List<Region> regions;
  Regions({
    this.regions = const <Region>[],
  });

  factory Regions.fromJSON(Map<String, dynamic> json) {
    return Regions(
      regions: json["states"] == null ? <Region>[] : List<Region>.from(json["states"]!.map((x) => Region.fromJSON(x))),
    );
  }
}

class Region {
  late int? id;
  late String? idZone;
  late String? idCountry;
  late String? isoCode;
  late String? name;
  late String? active;

  Region({
    this.id,
    this.idZone,
    this.idCountry,
    this.isoCode,
    this.name,
    this.active,
  });

  factory Region.fromJSON(Map<String, dynamic> json) {
    return Region(
      id: json["id"],
      idZone: json["id_zone"],
      idCountry: json["id_country"],
      isoCode: json["iso_code"],
      name: json["name"],
      active: json["active"],
    );
  }
}
