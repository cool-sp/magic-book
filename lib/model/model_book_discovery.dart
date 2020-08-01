import 'package:json_annotation/json_annotation.dart';

import 'model_book.dart';

part 'model_book_discovery.g.dart';

@JsonSerializable(nullable: true)
class ModelBookDiscovery {
  List<ModelBook> items;
  bool result;
  int total;

  ModelBookDiscovery({this.items, this.result, this.total});
  factory ModelBookDiscovery.fromJson(Map<String, dynamic> json) =>
      _$ModelBookDiscoveryFromJson(json);
  Map<String, dynamic> toJson() => _$ModelBookDiscoveryToJson(this);
}
