import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/news_detail_screen.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  NewsList({this.articles});

  void _showNewsArticleDetails(context, article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsDetailScreen(
        article: article,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          ...List.generate(
            articles.length,
            (index) {
              var article = articles[index];
              return GestureDetector(
                onTap: () {
                  _showNewsArticleDetails(context, article);
                },
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 25,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 110,
                        child: CachedNetworkImage(
                          imageUrl: article.urlToImage ?? '',
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              article.title,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              article.publishedAt,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
