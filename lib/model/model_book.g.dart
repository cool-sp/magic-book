// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelBook _$ModelBookFromJson(Map<String, dynamic> json) {
  return ModelBook(
    abbreviation: json['abbreviation'] as String,
    chapterCount: json['chapterCount'] as int,
    coverUrl: json['coverUrl'] as String,
    genres: (json['genres'] as List)?.map((e) => e as String)?.toList(),
    id: json['id'] as int,
    language: json['language'] as String,
    name: json['name'] as String,
    reviewScore: (json['reviewScore'] as num)?.toDouble(),
    slug: json['slug'] as String,
    sneakPeek: json['sneakPeek'] as bool,
    status: json['status'] as int,
    synopsis: json['synopsis'] as String,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    timeCreated: (json['timeCreated'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ModelBookToJson(ModelBook instance) => <String, dynamic>{
      'abbreviation': instance.abbreviation,
      'chapterCount': instance.chapterCount,
      'coverUrl': instance.coverUrl,
      'genres': instance.genres,
      'id': instance.id,
      'language': instance.language,
      'name': instance.name,
      'reviewScore': instance.reviewScore,
      'slug': instance.slug,
      'sneakPeek': instance.sneakPeek,
      'status': instance.status,
      'synopsis': instance.synopsis,
      'tags': instance.tags,
      'timeCreated': instance.timeCreated,
    };
