class NewsArticle {
  String urlToImage;
  String title;
  String content;
  String newsUrl;
  String date;

  NewsArticle(
      {required this.urlToImage,
      required this.newsUrl,
      required this.date,
      required this.content,
      required this.title});

  static fromAPItoApp(Map<String, dynamic> article) {
    return NewsArticle(
        urlToImage: article["urlToImage"] ??
            "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80",
        newsUrl: article["url"] ??
            "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
        date: article["publishedAt"] ?? DateTime.now(),
        content: article["content"] ?? "content",
        title: article["title"] ?? "title");
  }
}
