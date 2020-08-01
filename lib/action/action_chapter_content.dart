import 'package:dio/dio.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:meta/meta.dart';

import 'action.dart';
import '../util/http.dart';
import '../model/model_chapter_content.dart';

class ActionChapterContent extends HttpExecutable<ModelChapterContent> {
  String href;
  ActionChapterContent({@required this.href});

  @override
  String getSubPath() => this.href;

  @override
  Future<ModelChapterContent> execute() async {
    String path = getPath();
    String html = await _loadHtml(path);

    Document doc = parse(html);
    ModelChapterContent chapterContent = ModelChapterContent();
    chapterContent.content = _getChapterContent(doc);
    return chapterContent;
  }

  Future<String> _loadHtml(String path) async {
    Options options = Options();
    options.contentType = 'text/html; charset=utf-8';
    return await Http.get(path, options: options);
  }

  List<String> _getChapterContent(Document doc) {
    List<Element> elements =
        doc.querySelectorAll('div[id="chapter-content"] > p') ?? [];
    List<String> chapterContent = elements.map((e) => e.text).toList();
    chapterContent.removeWhere((element) => element.isEmpty);
    return chapterContent;
  }
}
