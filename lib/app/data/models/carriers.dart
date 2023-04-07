// To parse this JSON data, do
//
//     final carriers = carriersFromJson(jsonString);

import "dart:convert";

Carriers carriersFromJson(String str) => Carriers.fromJson(json.decode(str));

class Carriers {
  late List<Carrier> carriers;
  Carriers({
    this.carriers = const <Carrier>[],
  });

  factory Carriers.fromJson(Map<String, dynamic> json) {
    return Carriers(
      carriers: json["carriers"] == null ? <Carrier>[] : List<Carrier>.from(json["carriers"]!.map((x) => Carrier.fromJson(x))),
    );
  }
}

class Carrier {
  late int? id;
  late String? deleted;
  late String? isModule;
  late dynamic idTaxRulesGroup;
  late String? idReference;
  late String? name;
  late String? active;
  late String? isFree;
  late String? url;
  late String? shippingHandling;
  late String? shippingExternal;
  late String? rangeBehavior;
  late String? shippingMethod;
  late String? maxWidth;
  late String? maxHeight;
  late String? maxDepth;
  late String? maxWeight;
  late String? grade;
  late String? needRange;
  late String? position;
  late String? delay;

  Carrier({
    this.id,
    this.deleted,
    this.isModule,
    this.idTaxRulesGroup,
    this.idReference,
    this.name,
    this.active,
    this.isFree,
    this.url,
    this.shippingHandling,
    this.shippingExternal,
    this.rangeBehavior,
    this.shippingMethod,
    this.maxWidth,
    this.maxHeight,
    this.maxDepth,
    this.maxWeight,
    this.grade,
    this.needRange,
    this.position,
    this.delay,
  });

  factory Carrier.fromJson(Map<String, dynamic> json) {
    return Carrier(
      id: json["id"],
      deleted: json["deleted"],
      isModule: json["is_module"],
      idTaxRulesGroup: json["id_tax_rules_group"],
      idReference: json["id_reference"],
      name: json["name"],
      active: json["active"],
      isFree: json["is_free"],
      url: json["url"],
      shippingHandling: json["shipping_handling"],
      shippingExternal: json["shipping_external"],
      rangeBehavior: json["range_behavior"],
      shippingMethod: json["shipping_method"],
      maxWidth: json["max_width"],
      maxHeight: json["max_height"],
      maxDepth: json["max_depth"],
      maxWeight: json["max_weight"],
      grade: json["grade"],
      needRange: json["need_range"],
      position: json["position"],
      delay: json["delay"],
    );
  }
}
