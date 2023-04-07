// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import "dart:convert";

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

class Products {
  late String title;
  late List<Product> products;

  Products({
    this.title = "",
    this.products = const <Product>[],
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      title: json["title"] ?? "",
      products: json["products"] == null ? <Product>[] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    );
  }
}

class Product {
  late int? id;
  late String? idManufacturer;
  late String? idSupplier;
  late String? idCategoryDefault;
  late dynamic productNew;
  late String? cacheDefaultAttribute;
  late String? idDefaultImage;
  late int? idDefaultCombination;
  late String? idTaxRulesGroup;
  late String? positionInCategory;
  late dynamic manufacturerName;
  late String? quantity;
  late String? type;
  late String? idShopDefault;
  late String? reference;
  late String? supplierReference;
  late String? location;
  late String? width;
  late String? height;
  late String? depth;
  late String? weight;
  late String? quantityDiscount;
  late String? ean13;
  late String? isbn;
  late String? upc;
  late String? cacheIsPack;
  late String? cacheHasAttachments;
  late String? isVirtual;
  late String? state;
  late String? additionalDeliveryTimes;
  late String? deliveryInStock;
  late String? deliveryOutStock;
  late String? onSale;
  late String? onlineOnly;
  late String? ecotax;
  late String? minimalQuantity;
  late dynamic lowStockThreshold;
  late String? lowStockAlert;
  late String? price;
  late String? wholesalePrice;
  late String? unity;
  late String? unitPriceRatio;
  late String? additionalShippingCost;
  late String? customizable;
  late String? textFields;
  late String? uploadableFiles;
  late String? active;
  late String? redirectType;
  late String? idTypeRedirected;
  late String? availableForOrder;
  late String? availableDate;
  late String? showCondition;
  late String? condition;
  late String? showPrice;
  late String? indexed;
  late String? visibility;
  late String? advancedStockManagement;
  late DateTime? dateAdd;
  late DateTime? dateUpd;
  late String? packStockType;
  late String? metaDescription;
  late String? metaKeywords;
  late String? metaTitle;
  late String? linkRewrite;
  late String? name;
  late String? description;
  late String? descriptionShort;
  late String? availableNow;
  late String? availableLater;
  late Associations? associations;

  ///
  late int count;
  late String? asset;

  Product({
    this.id,
    this.idManufacturer,
    this.idSupplier,
    this.idCategoryDefault,
    this.productNew,
    this.cacheDefaultAttribute,
    this.idDefaultImage,
    this.idDefaultCombination,
    this.idTaxRulesGroup,
    this.positionInCategory,
    this.manufacturerName,
    this.quantity,
    this.type,
    this.idShopDefault,
    this.reference,
    this.supplierReference,
    this.location,
    this.width,
    this.height,
    this.depth,
    this.weight,
    this.quantityDiscount,
    this.ean13,
    this.isbn,
    this.upc,
    this.cacheIsPack,
    this.cacheHasAttachments,
    this.isVirtual,
    this.state,
    this.additionalDeliveryTimes,
    this.deliveryInStock,
    this.deliveryOutStock,
    this.onSale,
    this.onlineOnly,
    this.ecotax,
    this.minimalQuantity,
    this.lowStockThreshold,
    this.lowStockAlert,
    this.price,
    this.wholesalePrice,
    this.unity,
    this.unitPriceRatio,
    this.additionalShippingCost,
    this.customizable,
    this.textFields,
    this.uploadableFiles,
    this.active,
    this.redirectType,
    this.idTypeRedirected,
    this.availableForOrder,
    this.availableDate,
    this.showCondition,
    this.condition,
    this.showPrice,
    this.indexed,
    this.visibility,
    this.advancedStockManagement,
    this.dateAdd,
    this.dateUpd,
    this.packStockType,
    this.metaDescription,
    this.metaKeywords,
    this.metaTitle,
    this.linkRewrite,
    this.name,
    this.description,
    this.descriptionShort,
    this.availableNow,
    this.availableLater,
    this.associations,

    ///
    this.count = 0,
    this.asset,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      idManufacturer: json["id_manufacturer"],
      idSupplier: json["id_supplier"],
      idCategoryDefault: json["id_category_default"],
      productNew: json["new"],
      cacheDefaultAttribute: json["cache_default_attribute"],
      idDefaultImage: json["id_default_image"],
      idDefaultCombination: json["id_default_combination"],
      idTaxRulesGroup: json["id_tax_rules_group"],
      positionInCategory: json["position_in_category"],
      manufacturerName: json["manufacturer_name"],
      quantity: json["quantity"],
      type: json["type"],
      idShopDefault: json["id_shop_default"],
      reference: json["reference"],
      supplierReference: json["supplier_reference"],
      location: json["location"],
      width: json["width"],
      height: json["height"],
      depth: json["depth"],
      weight: json["weight"],
      quantityDiscount: json["quantity_discount"],
      ean13: json["ean13"],
      isbn: json["isbn"],
      upc: json["upc"],
      cacheIsPack: json["cache_is_pack"],
      cacheHasAttachments: json["cache_has_attachments"],
      isVirtual: json["is_virtual"],
      state: json["state"],
      additionalDeliveryTimes: json["additional_delivery_times"],
      deliveryInStock: json["delivery_in_stock"],
      deliveryOutStock: json["delivery_out_stock"],
      onSale: json["on_sale"],
      onlineOnly: json["online_only"],
      ecotax: json["ecotax"],
      minimalQuantity: json["minimal_quantity"],
      lowStockThreshold: json["low_stock_threshold"],
      lowStockAlert: json["low_stock_alert"],
      price: json["price"],
      wholesalePrice: json["wholesale_price"],
      unity: json["unity"],
      unitPriceRatio: json["unit_price_ratio"],
      additionalShippingCost: json["additional_shipping_cost"],
      customizable: json["customizable"],
      textFields: json["text_fields"],
      uploadableFiles: json["uploadable_files"],
      active: json["active"],
      redirectType: json["redirect_type"],
      idTypeRedirected: json["id_type_redirected"],
      availableForOrder: json["available_for_order"],
      availableDate: json["available_date"],
      showCondition: json["show_condition"],
      condition: json["condition"],
      showPrice: json["show_price"],
      indexed: json["indexed"],
      visibility: json["visibility"],
      advancedStockManagement: json["advanced_stock_management"],
      dateAdd: json["date_add"] == null ? null : DateTime.parse(json["date_add"]),
      dateUpd: json["date_upd"] == null ? null : DateTime.parse(json["date_upd"]),
      packStockType: json["pack_stock_type"],
      metaDescription: json["meta_description"],
      metaKeywords: json["meta_keywords"],
      metaTitle: json["meta_title"],
      linkRewrite: json["link_rewrite"],
      name: json["name"],
      description: json["description"],
      descriptionShort: json["description_short"],
      availableNow: json["available_now"],
      availableLater: json["available_later"],
      associations: json["associations"] == null ? null : Associations.fromJson(json["associations"]),
    );
  }
}

class Associations {
  late List<Element> categories;
  late List<Element> images;
  late List<Availablity> stockAvailable;
  late List<ProductFeature> productFeatures;
  late List<ProductBundle> productBundle;

  Associations({
    this.categories = const <Element>[],
    this.images = const <Element>[],
    this.stockAvailable = const <Availablity>[],
    this.productFeatures = const <ProductFeature>[],
    this.productBundle = const <ProductBundle>[],
  });

  factory Associations.fromJson(Map<String, dynamic> json) {
    return Associations(
      categories: json["categories"] == null ? [] : List<Element>.from(json["categories"]!.map((x) => Element.fromJson(x))),
      images: json["images"] == null ? [] : List<Element>.from(json["images"]!.map((x) => Element.fromJson(x))),
      stockAvailable: json["stock_availables"] == null ? [] : List<Availablity>.from(json["stock_availables"]!.map((x) => Availablity.fromJson(x))),
      productFeatures: json["product_features"] == null ? [] : List<ProductFeature>.from(json["product_features"]!.map((x) => ProductFeature.fromJson(x))),
      productBundle: json["product_bundle"] == null ? [] : List<ProductBundle>.from(json["product_bundle"]!.map((x) => ProductBundle.fromJson(x))),
    );
  }
}

class Element {
  late String? id;

  Element({this.id});

  factory Element.fromJson(Map<String, dynamic> json) {
    return Element(id: json["id"]);
  }
}

class ProductBundle {
  late String? id;
  late String? idProductAttribute;
  late String? quantity;

  ProductBundle({
    this.id,
    this.idProductAttribute,
    this.quantity,
  });

  factory ProductBundle.fromJson(Map<String, dynamic> json) {
    return ProductBundle(
      id: json["id"],
      idProductAttribute: json["id_product_attribute"],
      quantity: json["quantity"],
    );
  }
}

class ProductFeature {
  late String? id;
  late String? idFeatureValue;

  ProductFeature({
    this.id,
    this.idFeatureValue,
  });

  factory ProductFeature.fromJson(Map<String, dynamic> json) {
    return ProductFeature(
      id: json["id"],
      idFeatureValue: json["id_feature_value"],
    );
  }
}

class Availablity {
  late String? id;
  late String? idProductAttribute;

  Availablity({
    this.id,
    this.idProductAttribute,
  });

  factory Availablity.fromJson(Map<String, dynamic> json) {
    return Availablity(
      id: json["id"],
      idProductAttribute: json["id_product_attribute"],
    );
  }
}
