class NewsArticle {
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String pulishedAt;
  final String content;

  NewsArticle({
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.url,
    this.pulishedAt,
    this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      pulishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
