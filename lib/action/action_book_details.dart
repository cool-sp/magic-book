import 'package:dio/dio.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:meta/meta.dart';

import 'action.dart';
import '../util/http.dart';
import '../model/model_book_details.dart';
import '../model/model_chapter_details.dart';

class ActionBookDetails extends HttpExecutable<ModelBookDetails> {
  String slug;
  ActionBookDetails({@required this.slug});

  @override
  String getSubPath() => '/novel/$slug';

  @override
  Future<ModelBookDetails> execute() async {
    String path = getPath();
    String html = await _loadHtml(path);

    Document doc = parse(html);
    ModelBookDetails details = ModelBookDetails();
    details.name = _getName(doc);
    details.coverUrl = _getCoverUrl(doc);
    details.reviewSummary = _getReviewSummary(doc);
    details.reviewCount = _getReviewCount(doc);
    details.translator = _getTranslator(doc);
    details.author = _getAuthor(doc);
    details.chapters = _getChapterDetails(doc);

    return details;
  }

  Future<String> _loadHtml(String path) async {
    Options options = Options();
    options.contentType = 'text/html; charset=utf-8';

    return await Http.get(path, options: options);
  }

  String _getName(Document doc) {
    return doc.querySelector('div[class="novel-body"] > h2')?.text ?? '';
  }

  String _getCoverUrl(Document doc) {
    return doc
            .querySelector('div[class="novel-left"] > a > img')
            ?.attributes['src'] ??
        '';
  }

  String _getReviewSummary(Document doc) {
    return doc.querySelector('div[class="novel-body"] > div > h4').text;
  }

  String _getReviewCount(Document doc) {
    return doc.querySelector('div[class="novel-body"] > div > small').text;
  }

  String _getTranslator(Document doc) {
    List<Element> elements =
        doc.querySelectorAll('div[class="novel-body"] > dd') ?? [];
    if (elements.length > 0) {
      return elements[0].text;
    }
    return '';
  }

  String _getAuthor(Document doc) {
    List<Element> elements =
        doc.querySelectorAll('div[class="novel-body"] > dd') ?? [];
    if (elements.length > 1) {
      return elements[1].text;
    }
    return '';
  }

  List<ModelChapterDetails> _getChapterDetails(Document doc) {
    List<Element> elements =
        doc.querySelectorAll('li[class="chapter-item"]') ?? [];
    if (elements.length > 0) {
      return elements.map((e) {
        return ModelChapterDetails(
            name: e.querySelector('a')?.text ?? '',
            href: e.querySelector('a')?.attributes['href'] ?? '');
      }).toList();
    }

    return [];
  }
}
