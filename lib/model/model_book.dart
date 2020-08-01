import 'package:json_annotation/json_annotation.dart';

part 'model_book.g.dart';

@JsonSerializable(nullable: true)
class ModelBook {
  String abbreviation;
  int chapterCount;
  String coverUrl;
  List<String> genres;
  int id;
  String language;
  String name;
  double reviewScore;
  String slug;
  bool sneakPeek;
  int status;
  String synopsis;
  List<String> tags;
  double timeCreated;

  ModelBook(
      {this.abbreviation,
      this.chapterCount,
      this.coverUrl,
      this.genres,
      this.id,
      this.language,
      this.name,
      this.reviewScore,
      this.slug,
      this.sneakPeek,
      this.status,
      this.synopsis,
      this.tags,
      this.timeCreated});
  factory ModelBook.fromJson(Map<String, dynamic> json) =>
      _$ModelBookFromJson(json);
  Map<String, dynamic> toJson() => _$ModelBookToJson(this);
}
