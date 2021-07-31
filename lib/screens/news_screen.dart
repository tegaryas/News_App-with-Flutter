import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/screens/widgets/header.dart';
import 'package:news_app/screens/widgets/headline.dart';
import 'package:news_app/screens/widgets/headline_list.dart';
import 'package:news_app/screens/widgets/news_list.dart';
import 'package:news_app/viewmodels/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();

    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .newsCollection();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white, // Color for Android
          systemNavigationBarColor: Colors.white,
          statusBarBrightness:
              Brightness.dark // Dark == white status bar -- for IOS.
          ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              Headline(
                headline: 'Headlines News',
              ),
              HeadlineNewsList(
                articles: listViewModel.articles,
              ),
              SizedBox(
                height: 10,
              ),
              Headline(
                headline: 'World News',
              ),
              NewsList(
                articles: listViewModel.listArticles,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
