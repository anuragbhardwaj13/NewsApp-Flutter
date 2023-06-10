//https://newsapi.org/v2/top-headlines?country=in&apiKey=c71655f076cf438cbac48b461f663ff0

import 'dart:convert';

import 'package:http/http.dart';
import 'package:inshorts_clone/model/newsArticle.dart';

class FetchNews {
  static Future<NewsArticle> fetchNews(int index) async {
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=c71655f076cf438cbac48b461f663ff0"));

    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];

    var selectedArticle = articles[index % articles.length];
    return NewsArticle.fromAPItoApp(selectedArticle);
  }
}
