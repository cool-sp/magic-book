// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_book_discovery.type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoveryParameters _$DiscoveryParametersFromJson(Map<String, dynamic> json) {
  return DiscoveryParameters(
    active: json['active'] as bool,
    count: json['count'] as int,
    genres: (json['genres'] as List)?.map((e) => e as String)?.toList(),
    language: json['language'] as String,
    searchAfter: json['searchAfter'] as int,
    sortAsc: json['sortAsc'] as bool,
    sortType: json['sortType'] as String,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$DiscoveryParametersToJson(
        DiscoveryParameters instance) =>
    <String, dynamic>{
      'active': instance.active,
      'count': instance.count,
      'genres': instance.genres,
      'language': instance.language,
      'searchAfter': instance.searchAfter,
      'sortAsc': instance.sortAsc,
      'sortType': instance.sortType,
      'tags': instance.tags,
      'title': instance.title,
    };
