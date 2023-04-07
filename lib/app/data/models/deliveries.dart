import "dart:convert";

Deliveries deliveriesFromJson(String str) => Deliveries.fromJson(json.decode(str));

class Deliveries {
  late List<Delivery> deliveries;
  Deliveries({
    this.deliveries = const <Delivery>[],
  });

  factory Deliveries.fromJson(Map<String, dynamic> json) {
    return Deliveries(
      deliveries: json["deliveries"] == null ? <Delivery>[] : List<Delivery>.from(json["deliveries"]!.map((x) => Delivery.fromJson(x))),
    );
  }
}

class Delivery {
  Delivery({
    this.id,
    this.idCarrier,
    this.idRangePrice,
    this.idRangeWeight,
    this.idZone,
    this.idShop,
    this.idShopGroup,
    this.price,
  });

  int? id;
  String? idCarrier;
  String? idRangePrice;
  String? idRangeWeight;
  String? idZone;
  String? idShop;
  String? idShopGroup;
  String? price;

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      id: json["id"],
      idCarrier: json["id_carrier"],
      idRangePrice: json["id_range_price"],
      idRangeWeight: json["id_range_weight"],
      idZone: json["id_zone"],
      idShop: json["id_shop"],
      idShopGroup: json["id_shop_group"],
      price: json["price"],
    );
  }
}
