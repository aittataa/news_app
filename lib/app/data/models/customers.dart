import "dart:convert";

Customers customersFromJSON(String str) => Customers.fromJSON(json.decode(str));

String customersToJSON(Customers data) => json.encode(data.toJSON());

class Customers {
  late List<Customer> customers;
  Customers({
    this.customers = const <Customer>[],
  });

  factory Customers.fromJSON(Map<String, dynamic> json) {
    return Customers(
      customers: json["customers"] == null ? <Customer>[] : List<Customer>.from(json["customers"]!.map((x) => Customer.fromJSON(x))),
    );
  }

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "customers": List<dynamic>.from(customers.map((Customer x) => x.toJSON())),
    };
  }
}

class Customer {
  late dynamic id;
  late String? idDefaultGroup;
  late dynamic idLang;
  late String? newsletterDateAdd;
  late String? ipRegistrationNewsletter;
  late DateTime? lastPasswdGen;
  late String? secureKey;
  late String? deleted;
  late String? password;
  late String? lastname;
  late String? firstname;
  late String? email;
  late String? idGender;
  late String? birthday;
  late String? newsletter;
  late String? option;
  late String? website;
  late String? company;
  late String? siret;
  late String? ape;
  late String? outstandingAllowAmount;
  late String? showPublicPrices;
  late String? idRisk;
  late String? maxPaymentDays;
  late String? active;
  late String? note;
  late String? isGuest;
  late dynamic idShop;
  late dynamic idShopGroup;
  late DateTime? dateAdd;
  late DateTime? dateUpd;
  late String? resetPasswordToken;
  late String? resetPasswordValidity;
  late Associations? associations;

  Customer({
    this.id,
    this.idDefaultGroup,
    this.idLang,
    this.newsletterDateAdd,
    this.ipRegistrationNewsletter,
    this.lastPasswdGen,
    this.secureKey,
    this.deleted,
    this.password,
    this.lastname,
    this.firstname,
    this.email,
    this.idGender,
    this.birthday,
    this.newsletter,
    this.option,
    this.website,
    this.company,
    this.siret,
    this.ape,
    this.outstandingAllowAmount,
    this.showPublicPrices,
    this.idRisk,
    this.maxPaymentDays,
    this.active,
    this.note,
    this.isGuest,
    this.idShop,
    this.idShopGroup,
    this.dateAdd,
    this.dateUpd,
    this.resetPasswordToken,
    this.resetPasswordValidity,
    this.associations,
  });

  factory Customer.fromJSON(Map<String, dynamic> json) {
    return Customer(
      id: json["id"],
      idDefaultGroup: json["id_default_group"],
      idLang: json["id_lang"],
      newsletterDateAdd: json["newsletter_date_add"],
      ipRegistrationNewsletter: json["ip_registration_newsletter"],
      lastPasswdGen: json["last_passwd_gen"] == null ? null : DateTime.parse(json["last_passwd_gen"]),
      secureKey: json["secure_key"],
      deleted: json["deleted"],
      password: json["passwd"],
      lastname: json["lastname"],
      firstname: json["firstname"],
      email: json["email"],
      idGender: json["id_gender"],
      birthday: json["birthday"],
      newsletter: json["newsletter"],
      option: json["optin"],
      website: json["website"],
      company: json["company"],
      siret: json["siret"],
      ape: json["ape"],
      outstandingAllowAmount: json["outstanding_allow_amount"],
      showPublicPrices: json["show_public_prices"],
      idRisk: json["id_risk"],
      maxPaymentDays: json["max_payment_days"],
      active: json["active"],
      note: json["note"],
      isGuest: json["is_guest"],
      idShop: json["id_shop"],
      idShopGroup: json["id_shop_group"],
      dateAdd: json["date_add"] == null ? null : DateTime.parse(json["date_add"]),
      dateUpd: json["date_upd"] == null ? null : DateTime.parse(json["date_upd"]),
      resetPasswordToken: json["reset_password_token"],
      resetPasswordValidity: json["reset_password_validity"],
      associations: json["associations"] == null ? null : Associations.fromJSON(json["associations"]),
    );
  }

  String get toCreate {
    return """
    <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
    <customer>
      <firstname>$firstname</firstname>
      <lastname>$lastname</lastname>
      <email>$email</email>
      <passwd>$password</passwd>
      <active>1</active>
    </customer>
    </prestashop>
    """;
  }

  String get toUpdate {
    return '''
    <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
      <customer>
        <id>$id</id>
        <passwd>$password</passwd>
        <lastname>$lastname</lastname>
        <firstname>$firstname</firstname>
        <email>$email</email>
        <birthday>$birthday</birthday>
        <active>1</active>
      </customer>
    </prestashop>
  ''';
  }

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "id": id,
      "id_default_group": idDefaultGroup,
      "id_lang": idLang,
      "newsletter_date_add": newsletterDateAdd,
      "ip_registration_newsletter": ipRegistrationNewsletter,
      "last_passwd_gen": lastPasswdGen?.toIso8601String(),
      "secure_key": secureKey,
      "deleted": deleted,
      "passwd": password,
      "lastname": lastname,
      "firstname": firstname,
      "email": email,
      "id_gender": idGender,
      "birthday": birthday,
      "newsletter": newsletter,
      "optin": option,
      "website": website,
      "company": company,
      "siret": siret,
      "ape": ape,
      "outstanding_allow_amount": outstandingAllowAmount,
      "show_public_prices": showPublicPrices,
      "id_risk": idRisk,
      "max_payment_days": maxPaymentDays,
      "active": active,
      "note": note,
      "is_guest": isGuest,
      "id_shop": idShop,
      "id_shop_group": idShopGroup,
      "date_add": dateAdd?.toIso8601String(),
      "date_upd": dateUpd?.toIso8601String(),
      "reset_password_token": resetPasswordToken,
      "reset_password_validity": resetPasswordValidity,
      "associations": associations?.toJSON(),
    };
  }
}

class Associations {
  late List<Group> groups;
  Associations({
    this.groups = const <Group>[],
  });

  factory Associations.fromJSON(Map<String, dynamic> json) {
    return Associations(
      groups: json["groups"] == null ? <Group>[] : List<Group>.from(json["groups"]!.map((x) => Group.fromJSON(x))),
    );
  }

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "groups": List<dynamic>.from(groups.map((Group x) => x.toJSON())),
    };
  }
}

class Group {
  late String? id;
  Group({this.id});

  factory Group.fromJSON(Map<String, dynamic> json) {
    return Group(
      id: json["id"],
    );
  }

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "id": id,
    };
  }

  toXML() {}
}
