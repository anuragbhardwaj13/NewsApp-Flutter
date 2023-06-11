import 'package:flutter/material.dart';
import 'package:inshorts_clone/controller/fetchNews.dart';
import 'package:inshorts_clone/model/newsArticle.dart';
import 'package:inshorts_clone/view/widgets/newsContainer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsArticle newsArticle;
  int index = 0;
  final Map<int, NewsArticle> articleCache = {};

  Future<void> getNews() async {
    try {
      if (articleCache.containsKey(index)) {
        // Retrieve article from cache
        newsArticle = articleCache[index]!;
      } else {
        // Fetch article from API and store in cache
        newsArticle = await FetchNews.fetchNews(index);
        articleCache[index] = newsArticle;
      }
      setState(() {});
    } catch (e) {
      print('Error fetching news: $e');
    }
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: PageView.builder(
        controller: PageController(initialPage: 0),
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          setState(() {
            index = value;
            getNews();
          });
        },
        itemBuilder: (context, index) {
          return NewsContainer(
            newsUrl: newsArticle.newsUrl,
            urlToImage: newsArticle.urlToImage,
            content: newsArticle.content,
            title: newsArticle.title,
            date: newsArticle.date,
          );
        },
      ),
    );
  }
}
