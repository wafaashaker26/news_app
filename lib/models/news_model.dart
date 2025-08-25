class NewsModel {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json['status'] ?? "",
      totalResults: json['totalResults'] ?? 0,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => ArticleModel.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class ArticleModel {
  final String title;
  final String description;
  final String author;
  final String url;
  final String urlToImage;
  final String content;

  ArticleModel( {
    required this.title,
    required this.description,
    required this.author,
    required this.url,
    required this.urlToImage,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? "No Title",
      description: json['description'] ?? "No Description",
      author: json['author'] ?? "Unknown Author",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ??"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqxMCaePDZd0aZlYLjcLJwBtfuWFXwNnDjug&s",
      content: json['content'],

    );
  }
}
