import "dart:convert";

StocksAvailable stocksAvailableFromJson(String str) => StocksAvailable.fromJson(json.decode(str));

class StocksAvailable {
  late List<StockAvailable> stocksAvailable;

  StocksAvailable({
    this.stocksAvailable = const <StockAvailable>[],
  });

  factory StocksAvailable.fromJson(Map<String, dynamic> json) {
    return StocksAvailable(
      stocksAvailable: json["stock_availables"] == null ? <StockAvailable>[] : List<StockAvailable>.from(json["stock_availables"]!.map((x) => StockAvailable.fromJson(x))),
    );
  }
}

class StockAvailable {
  late int? id;
  late String? idProduct;
  late String? idProductAttribute;
  late String? idShop;
  late String? idShopGroup;
  late String? quantity;
  late String? dependsOnStock;
  late String? outOfStock;
  late String? location;

  StockAvailable({
    this.id,
    this.idProduct,
    this.idProductAttribute,
    this.idShop,
    this.idShopGroup,
    this.quantity,
    this.dependsOnStock,
    this.outOfStock,
    this.location,
  });

  factory StockAvailable.fromJson(Map<String, dynamic> json) {
    return StockAvailable(
      id: json["id"],
      idProduct: json["id_product"],
      idProductAttribute: json["id_product_attribute"],
      idShop: json["id_shop"],
      idShopGroup: json["id_shop_group"],
      quantity: json["quantity"],
      dependsOnStock: json["depends_on_stock"],
      outOfStock: json["out_of_stock"],
      location: json["location"],
    );
  }
}
