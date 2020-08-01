import 'package:json_annotation/json_annotation.dart';

part 'action_book_discovery.type.g.dart';

@JsonSerializable(nullable: true)
class DiscoveryParameters {
  bool active;
  int count;
  List<String> genres;
  String language;
  int searchAfter;
  bool sortAsc;
  String sortType;
  List<String> tags;
  String title;

  DiscoveryParameters(
      {this.active,
      this.count = 15,
      this.genres,
      this.language,
      this.searchAfter,
      this.sortAsc = true,
      this.sortType,
      this.tags = const [],
      this.title = ''});
  factory DiscoveryParameters.fromJson(Map<String, dynamic> json) =>
      _$DiscoveryParametersFromJson(json);
  Map<String, dynamic> toJson() => _$DiscoveryParametersToJson(this);

  DiscoveryParameters withActive(bool active) {
    this.active = active;
    return this;
  }

  DiscoveryParameters withCount(int count) {
    this.count = count;
    return this;
  }

  DiscoveryParameters withGenres(List<String> genres) {
    this.genres = genres;
    return this;
  }

  DiscoveryParameters withLanguage(String language) {
    this.language = language;
    return this;
  }

  DiscoveryParameters withSearchAfter(int searchAfter) {
    this.searchAfter = searchAfter;
    return this;
  }

  DiscoveryParameters withSortAsc(bool sortAsc) {
    this.sortAsc = sortAsc;
    return this;
  }

  DiscoveryParameters withSortType(String sortType) {
    this.sortType = sortType;
    return this;
  }

  DiscoveryParameters withTags(List<String> tags) {
    this.tags = tags;
    return this;
  }

  DiscoveryParameters withTitle(String title) {
    this.title = title;
    return this;
  }
}
