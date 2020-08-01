// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_book_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelBookSearch _$ModelBookSearchFromJson(Map<String, dynamic> json) {
  return ModelBookSearch(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : ModelBook.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    result: json['result'] as bool,
  );
}

Map<String, dynamic> _$ModelBookSearchToJson(ModelBookSearch instance) =>
    <String, dynamic>{
      'items': instance.items,
      'result': instance.result,
    };
