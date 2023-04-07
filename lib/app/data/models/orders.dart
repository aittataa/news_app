import "dart:convert";

import "products.dart";

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  late List<Order> orders;
  Orders({
    this.orders = const <Order>[],
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      orders: List<Order>.from(json["orders"]!.map((x) => Order.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "orders": List<dynamic>.from(orders.map((Order x) => x.toJson())),
    };
  }
}

class Order {
  late int? id;
  late String? idAddressDelivery;
  late String? idAddressInvoice;
  late String? idCart;
  late String? idCurrency;
  late String? idLang;
  late String? idCustomer;
  late String? idCarrier;
  late String? currentState;
  late String? module;
  late String? invoiceNumber;
  late String? invoiceDate;
  late String? deliveryNumber;
  late String? deliveryDate;
  late String? valid;
  late DateTime? dateAdd;
  late DateTime? dateUpd;
  late dynamic shippingNumber;
  late String? idShopGroup;
  late String? idShop;
  late String? secureKey;
  late String? payment;
  late String? recyclable;
  late String? gift;
  late dynamic giftMessage;
  late String? mobileTheme;
  late String? totalDiscounts;
  late String? totalDiscountsTaxIncl;
  late String? totalDiscountsTaxExcl;
  late String? totalPaid;
  late String? totalPaidTaxIncl;
  late String? totalPaidTaxExcl;
  late String? totalPaidReal;
  late String? totalProducts;
  late String? totalProductsWt;
  late String? totalShipping;
  late String? totalShippingTaxIncl;
  late String? totalShippingTaxExcl;
  late String? carrierTaxRate;
  late String? totalWrapping;
  late String? totalWrappingTaxIncl;
  late String? totalWrappingTaxExcl;
  late String? roundMode;
  late String? roundType;
  late String? conversionRate;
  late String? reference;
  late Associations? associations;
  late List<Product> products;

  Order({
    this.id,
    this.idAddressDelivery,
    this.idAddressInvoice,
    this.idCart,
    this.idCurrency,
    this.idLang,
    this.idCustomer,
    this.idCarrier,
    this.currentState,
    this.module,
    this.invoiceNumber,
    this.invoiceDate,
    this.deliveryNumber,
    this.deliveryDate,
    this.valid,
    this.dateAdd,
    this.dateUpd,
    this.shippingNumber,
    this.idShopGroup,
    this.idShop,
    this.secureKey,
    this.payment,
    this.recyclable,
    this.gift,
    this.giftMessage,
    this.mobileTheme,
    this.totalDiscounts,
    this.totalDiscountsTaxIncl,
    this.totalDiscountsTaxExcl,
    this.totalPaid,
    this.totalPaidTaxIncl,
    this.totalPaidTaxExcl,
    this.totalPaidReal,
    this.totalProducts,
    this.totalProductsWt,
    this.totalShipping,
    this.totalShippingTaxIncl,
    this.totalShippingTaxExcl,
    this.carrierTaxRate,
    this.totalWrapping,
    this.totalWrappingTaxIncl,
    this.totalWrappingTaxExcl,
    this.roundMode,
    this.roundType,
    this.conversionRate,
    this.reference,
    this.associations,
    this.products = const <Product>[],
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json["id"],
      idAddressDelivery: json["id_address_delivery"],
      idAddressInvoice: json["id_address_invoice"],
      idCart: json["id_cart"],
      idCurrency: json["id_currency"],
      idLang: json["id_lang"],
      idCustomer: json["id_customer"],
      idCarrier: json["id_carrier"],
      currentState: json["current_state"],
      module: json["module"],
      invoiceNumber: json["invoice_number"],
      invoiceDate: json["invoice_date"],
      deliveryNumber: json["delivery_number"],
      deliveryDate: json["delivery_date"],
      valid: json["valid"],
      dateAdd:
          json["date_add"] == null ? null : DateTime.parse(json["date_add"]),
      dateUpd:
          json["date_upd"] == null ? null : DateTime.parse(json["date_upd"]),
      shippingNumber: json["shipping_number"],
      idShopGroup: json["id_shop_group"],
      idShop: json["id_shop"],
      secureKey: json["secure_key"],
      payment: json["payment"],
      recyclable: json["recyclable"],
      gift: json["gift"],
      giftMessage: json["gift_message"],
      mobileTheme: json["mobile_theme"],
      totalDiscounts: json["total_discounts"],
      totalDiscountsTaxIncl: json["total_discounts_tax_incl"],
      totalDiscountsTaxExcl: json["total_discounts_tax_excl"],
      totalPaid: json["total_paid"],
      totalPaidTaxIncl: json["total_paid_tax_incl"],
      totalPaidTaxExcl: json["total_paid_tax_excl"],
      totalPaidReal: json["total_paid_real"],
      totalProducts: json["total_products"],
      totalProductsWt: json["total_products_wt"],
      totalShipping: json["total_shipping"],
      totalShippingTaxIncl: json["total_shipping_tax_incl"],
      totalShippingTaxExcl: json["total_shipping_tax_excl"],
      carrierTaxRate: json["carrier_tax_rate"],
      totalWrapping: json["total_wrapping"],
      totalWrappingTaxIncl: json["total_wrapping_tax_incl"],
      totalWrappingTaxExcl: json["total_wrapping_tax_excl"],
      roundMode: json["round_mode"],
      roundType: json["round_type"],
      conversionRate: json["conversion_rate"],
      reference: json["reference"],
      associations: json["associations"] == null
          ? null
          : Associations.fromJson(json["associations"]),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "id_address_delivery": idAddressDelivery,
      "id_address_invoice": idAddressInvoice,
      "id_cart": idCart,
      "id_currency": idCurrency,
      "id_lang": idLang,
      "id_customer": idCustomer,
      "id_carrier": idCarrier,
      "current_state": currentState,
      "module": module,
      "invoice_number": invoiceNumber,
      "invoice_date": invoiceDate,
      "delivery_number": deliveryNumber,
      "delivery_date": deliveryDate,
      "valid": valid,
      "date_add": dateAdd?.toIso8601String(),
      "date_upd": dateUpd?.toIso8601String(),
      "shipping_number": shippingNumber,
      "id_shop_group": idShopGroup,
      "id_shop": idShop,
      "secure_key": secureKey,
      "payment": payment,
      "recyclable": recyclable,
      "gift": gift,
      "gift_message": giftMessage,
      "mobile_theme": mobileTheme,
      "total_discounts": totalDiscounts,
      "total_discounts_tax_incl": totalDiscountsTaxIncl,
      "total_discounts_tax_excl": totalDiscountsTaxExcl,
      "total_paid": totalPaid,
      "total_paid_tax_incl": totalPaidTaxIncl,
      "total_paid_tax_excl": totalPaidTaxExcl,
      "total_paid_real": totalPaidReal,
      "total_products": totalProducts,
      "total_products_wt": totalProductsWt,
      "total_shipping": totalShipping,
      "total_shipping_tax_incl": totalShippingTaxIncl,
      "total_shipping_tax_excl": totalShippingTaxExcl,
      "carrier_tax_rate": carrierTaxRate,
      "total_wrapping": totalWrapping,
      "total_wrapping_tax_incl": totalWrappingTaxIncl,
      "total_wrapping_tax_excl": totalWrappingTaxExcl,
      "round_mode": roundMode,
      "round_type": roundType,
      "conversion_rate": conversionRate,
      "reference": reference,
      //"associations": associations?.toJson(),
    };
  }

  get toCreate {
    late String item = "";

    for (Product product in products) {
      item += """
          <order_row>
              <product_id>${product.id}</product_id>
              <product_quantity>${product.count}</product_quantity>
              <product_name>${product.name}</product_name>
              <product_reference>${product.reference}</product_reference>
              <product_price>${product.price}</product_price>
          </order_row>
      """;
    }
    return """
    <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
      <order>
         <id_address_delivery>$idAddressDelivery</id_address_delivery>
         <id_address_invoice>$idAddressInvoice</id_address_invoice>
         <id_cart>$idCart</id_cart>
         <id_currency>$idCurrency</id_currency>
         <id_lang>$idLang</id_lang>
         <id_customer>$idCustomer</id_customer>
         <id_carrier>$idCarrier</id_carrier>
	       <module>$module</module>
	       <payment>$payment</payment>
         <total_paid>$totalPaid</total_paid>
         <total_paid_real>$totalPaidReal</total_paid_real>
         <total_products>$totalProducts</total_products>
         <total_products_wt>$totalProductsWt</total_products_wt>
         <conversion_rate>$conversionRate</conversion_rate>
         <associations>
            <order_rows nodeType="order_row" virtualEntity="true">
              $item
            </order_rows>
         </associations>
      </order>
    </prestashop>
  """;
  }

  String get toUpdate {
    return """
    <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
      <order>
         <id>$id</id>
         <id_address_delivery>$idAddressDelivery</id_address_delivery>
         <id_address_invoice>$idAddressInvoice</id_address_invoice>
         <id_cart>$idCart</id_cart>
         <id_currency>$idCurrency</id_currency>
         <id_lang>$idLang</id_lang>
         <id_customer>$idCustomer</id_customer>
         <id_carrier>$idCarrier</id_carrier>
	       <module>$module</module>
	       <payment>$payment</payment>
         <total_paid>$totalPaid</total_paid>
         <total_paid_real>$totalPaidReal</total_paid_real>
         <total_products>$totalProducts</total_products>
         <total_products_wt>$totalProductsWt</total_products_wt>
         <conversion_rate>$conversionRate</conversion_rate>
      </order>
    </prestashop>
  """;
  }
}

class Associations {
  late List<OrderRow> orderRows;

  Associations({
    this.orderRows = const <OrderRow>[],
  });

  factory Associations.fromJson(Map<String, dynamic> json) {
    return Associations(
      orderRows: json["order_rows"] == null
          ? []
          : List<OrderRow>.from(
              json["order_rows"]!.map((x) => OrderRow.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "order_rows":
          List<dynamic>.from(orderRows.map((OrderRow x) => x.toJson())),
    };
  }
}

class OrderRow {
  late String? id;
  late String? productId;
  late String? productAttributeId;
  late String? productQuantity;
  late String? productName;
  late String? productReference;
  late dynamic productEan13;
  late dynamic productIsbn;
  late dynamic productUpc;
  late String? productPrice;
  late String? idCustomization;
  late String? unitPriceTaxIncl;
  late String? unitPriceTaxExcl;

  OrderRow({
    this.id,
    this.productId,
    this.productAttributeId,
    this.productQuantity,
    this.productName,
    this.productReference,
    this.productEan13,
    this.productIsbn,
    this.productUpc,
    this.productPrice,
    this.idCustomization,
    this.unitPriceTaxIncl,
    this.unitPriceTaxExcl,
  });

  factory OrderRow.fromJson(Map<String, dynamic> json) {
    return OrderRow(
      id: json["id"],
      productId: json["product_id"],
      productAttributeId: json["product_attribute_id"],
      productQuantity: json["product_quantity"],
      productName: json["product_name"],
      productReference: json["product_reference"],
      productEan13: json["product_ean13"],
      productIsbn: json["product_isbn"],
      productUpc: json["product_upc"],
      productPrice: json["product_price"],
      idCustomization: json["id_customization"],
      unitPriceTaxIncl: json["unit_price_tax_incl"],
      unitPriceTaxExcl: json["unit_price_tax_excl"],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "product_id": productId,
      "product_attribute_id": productAttributeId,
      "product_quantity": productQuantity,
      "product_name": productName,
      "product_reference": productReference,
      "product_ean13": productEan13,
      "product_isbn": productIsbn,
      "product_upc": productUpc,
      "product_price": productPrice,
      "id_customization": idCustomization,
      "unit_price_tax_incl": unitPriceTaxIncl,
      "unit_price_tax_excl": unitPriceTaxExcl,
    };
  }

  @override
  String toString() {
    return "$productId";
  }
}
