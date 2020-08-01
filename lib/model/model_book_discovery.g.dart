// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_book_discovery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelBookDiscovery _$ModelBookDiscoveryFromJson(Map<String, dynamic> json) {
  return ModelBookDiscovery(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : ModelBook.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    result: json['result'] as bool,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$ModelBookDiscoveryToJson(ModelBookDiscovery instance) =>
    <String, dynamic>{
      'items': instance.items,
      'result': instance.result,
      'total': instance.total,
    };
