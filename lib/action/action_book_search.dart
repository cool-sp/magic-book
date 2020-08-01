import 'package:meta/meta.dart';

import 'action.dart';
import '../util/http.dart';
import '../model/model_book_search.dart';

class ActionOfSearch extends HttpExecutable<ModelBookSearch> {
  String keyword;
  int count;
  ActionOfSearch({@required this.keyword, this.count});

  @override
  String getSubPath() => '/api/novels/search';

  @override
  Future<ModelBookSearch> execute() async {
    Map<String, dynamic> queryParameters = {
      'query': this.keyword,
      'count': this.count
    };

    Map<String, dynamic> response =
        await Http.get(getPath(), queryParameters: queryParameters);
    if (response != null) {
      ModelBookSearch result = ModelBookSearch.fromJson(response);
      return result;
    }
    return null;
  }
}
