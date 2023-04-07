import "dart:convert";

CartRules cartRulesFromJson(String str) => CartRules.fromJson(json.decode(str));

class CartRules {
  late List<CartRule> cartRules;
  CartRules({
    this.cartRules = const <CartRule>[],
  });

  factory CartRules.fromJson(Map<String, dynamic> json) {
    return CartRules(
      cartRules: json["cart_rules"] == null ? <CartRule>[] : List<CartRule>.from(json["cart_rules"].map((x) => CartRule.fromJson(x))),
    );
  }
}

class CartRule {
  CartRule({
    this.id,
    this.idCustomer,
    this.dateFrom,
    this.dateTo,
    this.description,
    this.quantity,
    this.quantityPerUser,
    this.priority,
    this.partialUse,
    this.code,
    this.minimumAmount,
    this.minimumAmountTax,
    this.minimumAmountCurrency,
    this.minimumAmountShipping,
    this.countryRestriction,
    this.carrierRestriction,
    this.groupRestriction,
    this.cartRuleRestriction,
    this.productRestriction,
    this.shopRestriction,
    this.freeShipping,
    this.reductionPercent,
    this.reductionAmount,
    this.reductionTax,
    this.reductionCurrency,
    this.reductionProduct,
    this.reductionExcludeSpecial,
    this.giftProduct,
    this.giftProductAttribute,
    this.highlight,
    this.active,
    this.dateAdd,
    this.dateUpd,
    this.name,
  });

  late int? id;
  late String? idCustomer;
  late DateTime? dateFrom;
  late DateTime? dateTo;
  late String? description;
  late String? quantity;
  late String? quantityPerUser;
  late String? priority;
  late String? partialUse;
  late String? code;
  late String? minimumAmount;
  late String? minimumAmountTax;
  late String? minimumAmountCurrency;
  late String? minimumAmountShipping;
  late String? countryRestriction;
  late String? carrierRestriction;
  late String? groupRestriction;
  late String? cartRuleRestriction;
  late String? productRestriction;
  late String? shopRestriction;
  late String? freeShipping;
  late String? reductionPercent;
  late String? reductionAmount;
  late String? reductionTax;
  late String? reductionCurrency;
  late String? reductionProduct;
  late String? reductionExcludeSpecial;
  late String? giftProduct;
  late String? giftProductAttribute;
  late String? highlight;
  late String? active;
  late DateTime? dateAdd;
  late DateTime? dateUpd;
  late String? name;

  factory CartRule.fromJson(Map<String, dynamic> json) {
    return CartRule(
      id: json["id"],
      idCustomer: json["id_customer"],
      dateFrom: DateTime.parse(json["date_from"]),
      dateTo: DateTime.parse(json["date_to"]),
      description: json["description"],
      quantity: json["quantity"],
      quantityPerUser: json["quantity_per_user"],
      priority: json["priority"],
      partialUse: json["partial_use"],
      code: json["code"],
      minimumAmount: json["minimum_amount"],
      minimumAmountTax: json["minimum_amount_tax"],
      minimumAmountCurrency: json["minimum_amount_currency"],
      minimumAmountShipping: json["minimum_amount_shipping"],
      countryRestriction: json["country_restriction"],
      carrierRestriction: json["carrier_restriction"],
      groupRestriction: json["group_restriction"],
      cartRuleRestriction: json["cart_rule_restriction"],
      productRestriction: json["product_restriction"],
      shopRestriction: json["shop_restriction"],
      freeShipping: json["free_shipping"],
      reductionPercent: json["reduction_percent"],
      reductionAmount: json["reduction_amount"],
      reductionTax: json["reduction_tax"],
      reductionCurrency: json["reduction_currency"],
      reductionProduct: json["reduction_product"],
      reductionExcludeSpecial: json["reduction_exclude_special"],
      giftProduct: json["gift_product"],
      giftProductAttribute: json["gift_product_attribute"],
      highlight: json["highlight"],
      active: json["active"],
      dateAdd: DateTime.parse(json["date_add"]),
      dateUpd: DateTime.parse(json["date_upd"]),
      name: json["name"],
    );
  }
}
