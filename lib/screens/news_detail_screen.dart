import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsDetailScreen({this.article});

  void _popNewsArticleDetails(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // Untuk rubah warna status bar di screens
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent, // Color for Android
          systemNavigationBarColor: Colors.white,
          statusBarBrightness:
              Brightness.dark // Dark == white status bar -- for IOS.
          ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.bottom),
                      );
                    },
                    blendMode: BlendMode.darken,
                    child: Image.network(
                      article.urlToImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _popNewsArticleDetails(context);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.only(
                            left: 5,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(
                                10,
                              )),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(
                              10,
                            )),
                        child: Center(
                          child: Icon(
                            Icons.bookmark,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      bottom: 50,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.publishedAt,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            height: 1.3,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          article.title,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            height: 1.5,
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
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.48,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  20,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            BuildSocialMediaButton(
                              icon: 'assets/images/facebook.png',
                            ),
                            BuildSocialMediaButton(
                              icon: 'assets/images/twitter.png',
                            ),
                            BuildSocialMediaButton(
                              icon: 'assets/images/envelope.png',
                            ),
                            BuildSocialMediaButton(
                              icon: 'assets/images/share.png',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '1575 comments',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              height: 1.3,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    article.description,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      height: 1.8,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    article.content,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      height: 1.8,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BuildSocialMediaButton extends StatelessWidget {
  final String icon;
  BuildSocialMediaButton({@required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      margin: EdgeInsets.only(
        right: 20,
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(
          50,
        ),
      ),
      child: Center(
        child: Image.asset(
          icon,
        ),
      ),
    );
  }
}
