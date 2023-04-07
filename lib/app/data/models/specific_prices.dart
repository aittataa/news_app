import "dart:convert";

SpecificPrices specificPricesFromJson(String str) => SpecificPrices.fromJson(json.decode(str));

class SpecificPrices {
  SpecificPrices({
    this.specificPrices = const <SpecificPrice>[],
  });

  late List<SpecificPrice> specificPrices;

  factory SpecificPrices.fromJson(Map<String, dynamic> json) {
    return SpecificPrices(
      specificPrices: json["specific_prices"] == null ? <SpecificPrice>[] : List<SpecificPrice>.from(json["specific_prices"].map((x) => SpecificPrice.fromJson(x))),
    );
  }
}

class SpecificPrice {
  SpecificPrice({
    required this.id,
    required this.idShopGroup,
    required this.idShop,
    required this.idCart,
    required this.idProduct,
    required this.idProductAttribute,
    required this.idCurrency,
    required this.idCountry,
    required this.idGroup,
    required this.idCustomer,
    required this.idSpecificPriceRule,
    required this.price,
    required this.fromQuantity,
    required this.reduction,
    required this.reductionTax,
    required this.reductionType,
    required this.from,
    required this.to,
  });

  int id;
  String idShopGroup;
  String idShop;
  String idCart;
  String idProduct;
  String idProductAttribute;
  String idCurrency;
  String idCountry;
  String idGroup;
  String idCustomer;
  String idSpecificPriceRule;
  String price;
  String fromQuantity;
  String reduction;
  String reductionTax;
  String reductionType;
  String from;
  String to;

  factory SpecificPrice.fromJson(Map<String, dynamic> json) {
    return SpecificPrice(
      id: json["id"],
      idShopGroup: json["id_shop_group"],
      idShop: json["id_shop"],
      idCart: json["id_cart"],
      idProduct: json["id_product"],
      idProductAttribute: json["id_product_attribute"],
      idCurrency: json["id_currency"],
      idCountry: json["id_country"],
      idGroup: json["id_group"],
      idCustomer: json["id_customer"],
      idSpecificPriceRule: json["id_specific_price_rule"],
      price: json["price"],
      fromQuantity: json["from_quantity"],
      reduction: json["reduction"],
      reductionTax: json["reduction_tax"],
      reductionType: json["reduction_type"],
      from: json["from"],
      to: json["to"],
    );
  }
}
