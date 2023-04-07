// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import "dart:convert";

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

class Categories {
  late List<Category> categories;
  Categories({
    this.categories = const <Category>[],
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      categories: json["categories"] == null ? <Category>[] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    );
  }
}

class Category {
  late int? id;
  late String? idParent;
  late String? levelDepth;
  late dynamic nbProductsRecursive;
  late String? active;
  late String? idShopDefault;
  late String? isRootCategory;
  late String? position;
  late DateTime? dateAdd;
  late DateTime? dateUpd;
  late String? name;
  late String? linkRewrite;
  //late Description? description;
  late String? metaTitle;
  late String? metaDescription;
  late String? metaKeywords;
  late Associations? associations;
  late String? asset;

  Category({
    this.id,
    this.idParent,
    this.levelDepth,
    this.nbProductsRecursive,
    this.active,
    this.idShopDefault,
    this.isRootCategory,
    this.position,
    this.dateAdd,
    this.dateUpd,
    this.name,
    this.linkRewrite,
    //this.description,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.associations,
    this.asset,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      idParent: json["id_parent"],
      levelDepth: json["level_depth"],
      nbProductsRecursive: json["nb_products_recursive"],
      active: json["active"],
      idShopDefault: json["id_shop_default"],
      isRootCategory: json["is_root_category"],
      position: json["position"],
      dateAdd: json["date_add"] == null ? null : DateTime.parse(json["date_add"]),
      dateUpd: json["date_upd"] == null ? null : DateTime.parse(json["date_upd"]),
      name: json["name"],
      linkRewrite: json["link_rewrite"],
      //description: descriptionValues.map[json["description"]],
      metaTitle: json["meta_title"],
      metaDescription: json["meta_description"],
      metaKeywords: json["meta_keywords"],
      associations: json["associations"] == null ? null : Associations.fromJson(json["associations"]),
    );
  }
}

class Associations {
  Associations({
    this.categories = const <ProductElement>[],
    this.products = const <ProductElement>[],
  });

  late List<ProductElement> categories;
  late List<ProductElement> products;

  factory Associations.fromJson(Map<String, dynamic> json) {
    return Associations(
      categories: json["categories"] == null ? <ProductElement>[] : List<ProductElement>.from(json["categories"]!.map((x) => ProductElement.fromJson(x))),
      products: json["products"] == null ? <ProductElement>[] : List<ProductElement>.from(json["products"]!.map((x) => ProductElement.fromJson(x))),
    );
  }
}

class ProductElement {
  ProductElement({this.id});

  late String? id;

  factory ProductElement.fromJson(Map<String, dynamic> json) {
    return ProductElement(id: json["id"]);
  }

  @override
  String toString() {
    return "$id";
  }
}
