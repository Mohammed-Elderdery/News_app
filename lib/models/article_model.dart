class Article {
  final String title;
  final String? description;
  final String? imageUrl;
  final String articleUrl;

  Article({
    required this.articleUrl,
    required this.title,
    this.description,
    this.imageUrl,
  });
  factory Article.fromjson(Map<String, dynamic> jsonData) {
    return Article(
      title: jsonData['title'],
      description: jsonData['description'],
      imageUrl: jsonData['urlToImage'],
      articleUrl: jsonData['url'],
    );
  }
}
