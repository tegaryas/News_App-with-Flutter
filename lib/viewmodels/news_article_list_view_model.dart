import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/services/web_services.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';

enum LoadingStatus {
  complete,
  searching,
  empty,
}

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];
  List<NewsArticleViewModel> listArticles = <NewsArticleViewModel>[];

  
  void topHeadlines() async {
    List<NewsArticle> newsArticle = await WebService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles = newsArticle
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.complete;
    }
    notifyListeners();
  }

  void newsCollection() async {
    List<NewsArticle> newsArticle = await WebService().fetchNewsList();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.listArticles = newsArticle
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.listArticles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.complete;
    }
    notifyListeners();
  }
}
