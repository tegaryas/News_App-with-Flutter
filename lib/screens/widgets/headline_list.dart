import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/news_detail_screen.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';

class HeadlineNewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  HeadlineNewsList({this.articles});

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
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          ...List.generate(
            articles.length,
            (index) {
              var article = articles[index];
              return GestureDetector(
                onTap: () {
                  _showNewsArticleDetails(context, article);
                },
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      height: 250,
                      width: 280,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.4),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.bottom),
                            );
                          },
                          blendMode: BlendMode.darken,
                          child: Container(
                            child: CachedNetworkImage(
                              imageUrl: article.urlToImage ?? '',
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Container(
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.title,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                height: 1.3,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              article.author,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.3,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
