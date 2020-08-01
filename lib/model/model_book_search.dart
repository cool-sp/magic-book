import 'package:json_annotation/json_annotation.dart';

import 'model_book.dart';

part 'model_book_search.g.dart';

@JsonSerializable(nullable: true)
class ModelBookSearch {
  List<ModelBook> items;
  bool result;

  ModelBookSearch({this.items, this.result});
  factory ModelBookSearch.fromJson(Map<String, dynamic> json) =>
      _$ModelBookSearchFromJson(json);
  Map<String, dynamic> toJson() => _$ModelBookSearchToJson(this);
}
