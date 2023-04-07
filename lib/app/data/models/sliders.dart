import "dart:convert";

Sliders slidersFromMap(String str) => Sliders.fromMap(json.decode(str));

class Sliders {
  late List<Item> items;

  Sliders({
    this.items = const <Item>[],
  });

  factory Sliders.fromMap(Map<String, dynamic> json) {
    return Sliders(
      items: json["items"] == null ? <Item>[] : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
    );
  }
}

class Item {
  late String? link;
  late String? img;

  Item({
    this.link,
    this.img,
  });

  factory Item.fromMap(Map<String, dynamic> json) {
    return Item(
      link: json["link"],
      img: json["img"],
    );
  }
}
