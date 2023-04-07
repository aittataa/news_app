// To parse this JSON data, do
//
//     final manufacturers = manufacturersFromJson(jsonString);

import "dart:convert";

Manufacturers manufacturersFromJson(String str) => Manufacturers.fromJson(json.decode(str));

class Manufacturers {
  late List<Manufacturer> manufacturers;
  Manufacturers({
    this.manufacturers = const <Manufacturer>[],
  });

  factory Manufacturers.fromJson(Map<String, dynamic> json) {
    return Manufacturers(
      manufacturers: json["manufacturers"] == null ? <Manufacturer>[] : List<Manufacturer>.from(json["manufacturers"]!.map((x) => Manufacturer.fromJson(x))),
    );
  }
}

class Manufacturer {
  late int? id;
  late String? active;
  late String? linkRewrite;
  late String? name;
  late DateTime? dateAdd;
  late DateTime? dateUpd;
  late List<Description>? description;
  late List<Description>? shortDescription;
  late List<Description>? metaTitle;
  late List<Description>? metaDescription;
  late List<Description>? metaKeywords;
  late Associations? associations;
  late String? asset;

  Manufacturer({
    this.id,
    this.active,
    this.linkRewrite,
    this.name,
    this.dateAdd,
    this.dateUpd,
    this.description,
    this.shortDescription,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.associations,
    this.asset,
  });

  factory Manufacturer.fromJson(Map<String, dynamic> json) {
    return Manufacturer(
      id: json["id"],
      active: json["active"],
      linkRewrite: json["link_rewrite"],
      name: json["name"],
      dateAdd: json["date_add"] == null ? null : DateTime.parse(json["date_add"]),
      dateUpd: json["date_upd"] == null ? null : DateTime.parse(json["date_upd"]),
      description: json["description"], // == null ? <Description>[] : List<Description>.from(json["description"]!.map((x) => Description.fromJson(x))),
      shortDescription: json["short_description"] == null ? <Description>[] : List<Description>.from(json["short_description"]!.map((x) => Description.fromJson(x))),
      metaTitle: json["meta_title"] == null ? <Description>[] : List<Description>.from(json["meta_title"]!.map((x) => Description.fromJson(x))),
      metaDescription: json["meta_description"] == null ? <Description>[] : List<Description>.from(json["meta_description"]!.map((x) => Description.fromJson(x))),
      metaKeywords: json["meta_keywords"] == null ? <Description>[] : List<Description>.from(json["meta_keywords"]!.map((x) => Description.fromJson(x))),
      associations: json["associations"] == null ? null : Associations.fromJson(json["associations"]),
    );
  }
}

class Associations {
  late List<Address> addresses;
  Associations({
    this.addresses = const <Address>[],
  });

  factory Associations.fromJson(Map<String, dynamic> json) {
    return Associations(
      addresses: json["addresses"] == null ? <Address>[] : List<Address>.from(json["addresses"]!.map((x) => Address.fromJson(x))),
    );
  }
}

class Address {
  late String? id;

  Address({this.id});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json["id"],
    );
  }
}

class Description {
  late String? id;
  late String? value;

  Description({
    this.id,
    this.value,
  });

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      id: json["id"],
      value: json["value"],
    );
  }
}
