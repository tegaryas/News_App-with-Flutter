import 'package:dio/dio.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/utils/constants.dart';

class WebService {
  var dio = new Dio();

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final response = await dio.get(Constant.WORLD_NEWS_URL);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<NewsArticle>> fetchNewsList() async {
    final response = await dio.get(Constant.TOP_HEADLINES_URL);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
