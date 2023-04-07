// To parse this JSON data, do
//
//     final weightRanges = weightRangesFromJson(jsonString);

import "dart:convert";

WeightRanges weightRangesFromJson(String str) => WeightRanges.fromJson(json.decode(str));

class WeightRanges {
  late List<WeightRange> weightRanges;
  WeightRanges({
    this.weightRanges = const <WeightRange>[],
  });

  factory WeightRanges.fromJson(Map<String, dynamic> json) {
    return WeightRanges(
      weightRanges: json["weight_ranges"] == null ? <WeightRange>[] : List<WeightRange>.from(json["weight_ranges"]!.map((x) => WeightRange.fromJson(x))),
    );
  }
}

class WeightRange {
  late int? id;
  late int? idCarrier;
  late int? delimiter1;
  late int? delimiter2;

  WeightRange({
    this.id,
    this.idCarrier,
    this.delimiter1,
    this.delimiter2,
  });

  factory WeightRange.fromJson(Map<String, dynamic> json) {
    return WeightRange(
      id: json["id"],
      idCarrier: json["id_carrier"],
      delimiter1: json["delimiter1"],
      delimiter2: json["delimiter2"],
    );
  }
}
