import "dart:convert";

import "countries.dart";
import "regions.dart";

Addresses addressesFromMap(String str) => Addresses.fromMap(json.decode(str));

String addressesToMap(Addresses data) => json.encode(data.toMap());

class Addresses {
  late List<Address> addresses;

  Addresses({
    this.addresses = const <Address>[],
  });

  factory Addresses.fromMap(Map<String, dynamic> json) {
    return Addresses(
      addresses: json["addresses"] == null ? <Address>[] : List<Address>.from(json["addresses"]!.map((x) => Address.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "addresses": List<dynamic>.from(addresses.map((Address x) => x.toMap())),
    };
  }
}

class Address {
  late int? id;
  late String? idCustomer;
  late String? idManufacturer;
  late String? idSupplier;
  late String? idWarehouse;
  late String? idCountry;
  late String? idState;
  late String? alias;
  late String? company;
  late String? lastname;
  late String? firstname;
  late dynamic vatNumber;
  late String? address1;
  late String? address2;
  late String? postcode;
  late String? city;
  late dynamic other;
  late String? phone;
  late dynamic phoneMobile;
  late dynamic dni;
  late String? deleted;
  late DateTime? dateAdd;
  late DateTime? dateUpd;

  ///
  late Region? region;
  late Country? country;

  Address({
    this.id,
    this.idCustomer,
    this.idManufacturer,
    this.idSupplier,
    this.idWarehouse,
    this.idCountry,
    this.idState,
    this.alias = "Mon Address",
    this.company,
    this.lastname,
    this.firstname,
    this.vatNumber,
    this.address1,
    this.address2,
    this.postcode,
    this.city,
    this.other,
    this.phone,
    this.phoneMobile,
    this.dni,
    this.deleted,
    this.dateAdd,
    this.dateUpd,

    ///
    this.region,
    this.country,
  });

  factory Address.fromMap(Map<String, dynamic> json) {
    return Address(
      id: json["id"],
      idCustomer: json["id_customer"],
      idManufacturer: json["id_manufacturer"],
      idSupplier: json["id_supplier"],
      idWarehouse: json["id_warehouse"],
      idCountry: json["id_country"],
      idState: json["id_state"],
      alias: json["alias"],
      company: json["company"],
      lastname: json["lastname"],
      firstname: json["firstname"],
      vatNumber: json["vat_number"],
      address1: json["address1"],
      address2: json["address2"],
      postcode: json["postcode"],
      city: json["city"],
      other: json["other"],
      phone: json["phone"],
      phoneMobile: json["phone_mobile"],
      dni: json["dni"],
      deleted: json["deleted"],
      dateAdd: json["date_add"] == null ? null : DateTime.parse(json["date_add"]),
      dateUpd: json["date_upd"] == null ? null : DateTime.parse(json["date_upd"]),
    );
  }

  String get toCreate {
    return """
    <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
      <address>
          <id_customer>$idCustomer</id_customer>
          <alias>$alias</alias>
          <firstname>$firstname</firstname>
          <lastname>$lastname</lastname>
          <address1>$address1</address1>
          <phone>$phone</phone>
          <id_state>$idState</id_state>
          <city>$city</city>
          <id_country>$idCountry</id_country>
      </address>
   </prestashop>
    """;
  }

  String get toUpdate {
    return """
    <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
      <address>
          <id>$id</id>
          <id_customer>$idCustomer</id_customer>
          <alias>$alias</alias>
          <firstname>$firstname</firstname>
          <lastname>$lastname</lastname>
          <address1>$address1</address1>
          <phone>$phone</phone>
          <id_state>$idState</id_state>
          <city>$city</city>
          <id_country>$idCountry</id_country>
      </address>
   </prestashop>
    """;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "id_customer": idCustomer,
      "id_manufacturer": idManufacturer,
      "id_supplier": idSupplier,
      "id_warehouse": idWarehouse,
      "id_country": idCountry,
      "id_state": idState,
      "alias": alias,
      "company": company,
      "lastname": lastname,
      "firstname": firstname,
      "vat_number": vatNumber,
      "address1": address1,
      "address2": address2,
      "postcode": postcode,
      "city": city,
      "other": other,
      "phone": phone,
      "phone_mobile": phoneMobile,
      "dni": dni,
      "deleted": deleted,
      "date_add": dateAdd?.toIso8601String(),
      "date_upd": dateUpd?.toIso8601String(),
    };
  }
}
