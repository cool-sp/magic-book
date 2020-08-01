import 'action.dart';
import 'action_book_discovery.type.dart';

import '../util/http.dart';
import '../model/model_book_discovery.dart';
import '../types/original_language.dart';
import '../types/book_status.dart';
import '../types/book_sort.dart';
import '../types/book_genre.dart';

class ActionOfDiscovery extends HttpExecutable<ModelBookDiscovery> {
  OriginalLanguage language;
  BookStatus status;
  BookSort sortBy;
  List<BookGenre> genres;

  ActionOfDiscovery(
      {this.language = OriginalLanguage.any,
      this.status = BookStatus.any,
      this.sortBy = BookSort.sortByName,
      this.genres = const []});

  @override
  String getSubPath() => '/api/novels/search';

  @override
  Future<ModelBookDiscovery> execute() async {
    DiscoveryParameters parameters = DiscoveryParameters();
    parameters.withLanguage(language.toStr());
    parameters.withActive(status.toActive());
    parameters.withSortType(sortBy.toStr());
    parameters.withGenres(genres.map((e) => e.toStr()).toList());

    Map<String, dynamic> response =
        await Http.post(getPath(), data: parameters.toJson());
    if (response != null) {
      ModelBookDiscovery result = ModelBookDiscovery.fromJson(response);
      return result;
    }
    return null;
  }
}
