import "dart:convert";

import "products.dart";

Carts cartsFromJson(String str) => Carts.fromJson(json.decode(str));

class Carts {
  late List<Cart> carts;
  Carts({
    this.carts = const <Cart>[],
  });

  factory Carts.fromJson(Map<String, dynamic> json) {
    return Carts(
      carts: json["carts"] == null ? <Cart>[] : List<Cart>.from(json["carts"]!.map((x) => Cart.fromJson(x))),
    );
  }
}

class Cart {
  late int? id;
  late String? idAddressDelivery;
  late String? idAddressInvoice;
  late String? idCurrency;
  late String? idCustomer;
  late String? idGuest;
  late String? idLang;
  late String? idShopGroup;
  late String? idShop;
  late String? idCarrier;
  late String? recyclable;
  late String? gift;
  late dynamic giftMessage;
  late String? mobileTheme;
  late String? deliveryOption;
  late String? secureKey;
  late String? allowSeperatedPackage;
  late DateTime? dateAdd;
  late DateTime? dateUpd;
  late List<Product> products;

  Cart({
    this.id,
    this.idAddressDelivery,
    this.idAddressInvoice,
    this.idCurrency,
    this.idCustomer,
    this.idGuest,
    this.idLang,
    this.idShopGroup,
    this.idShop,
    this.idCarrier,
    this.recyclable,
    this.gift,
    this.giftMessage,
    this.mobileTheme,
    this.deliveryOption,
    this.secureKey,
    this.allowSeperatedPackage,
    this.dateAdd,
    this.dateUpd,
    this.products = const <Product>[],
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: int.parse(json["id"]),
      idAddressDelivery: json["id_address_delivery"],
      idAddressInvoice: json["id_address_invoice"],
      idCurrency: json["id_currency"],
      idCustomer: json["id_customer"],
      idGuest: json["id_guest"],
      idLang: json["id_lang"],
      idShopGroup: json["id_shop_group"],
      idShop: json["id_shop"].toString(),
      idCarrier: json["id_carrier"],
      recyclable: json["recyclable"],
      gift: json["gift"],
      giftMessage: json["gift_message"],
      mobileTheme: json["mobile_theme"],
      deliveryOption: json["delivery_option"],
      secureKey: json["secure_key"],
      allowSeperatedPackage: json["allow_seperated_package"],
      dateAdd: json["date_add"] == null ? null : DateTime.parse(json["date_add"]),
      dateUpd: json["date_upd"] == null ? null : DateTime.parse(json["date_upd"]),
    );
  }

  get toXML {
    late String items = "";
    for (Product product in products) {
      items += """
       <cart_row>
          <id_product>${product.id}</id_product>
          <id_address_delivery>$idAddressDelivery</id_address_delivery>
          <quantity>${product.count}</quantity>
       </cart_row>
      """;
    }

    return """
    <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
      <cart>
        <!--id>$id</id-->
        <id_customer>$idCustomer</id_customer>
        <id_carrier>$idCarrier</id_carrier>
        <id_currency>$idCurrency</id_currency>
        <id_lang>$idLang</id_lang>
        <associations>
          <cart_rows>
            $items
            <cart_row>
              <id_product></id_product>
              <quantity></quantity>
            </cart_row>
          </cart_rows>
        </associations>
      </cart>
    </prestashop>
  """;
  }
}
