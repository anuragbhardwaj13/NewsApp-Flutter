// news_list.dart
import 'package:flutter/material.dart';
import 'package:inshorts_clone/controller/fetchNews.dart';
import 'package:inshorts_clone/model/category.dart';
import 'package:inshorts_clone/model/newsArticle.dart';
import 'package:inshorts_clone/view/widgets/newsContainer.dart';

class NewsList extends StatefulWidget {
  final Category category;

  NewsList({Key? key, required this.category}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  int index = 0;
  final Map<int, Future<NewsArticle>> articleCache = {};

  Future<NewsArticle> getNews(int index) async {
    if (!articleCache.containsKey(index)) {
      // Fetch article from API and store in cache
      articleCache[index] = FetchNews.fetchNews(index, widget.category);
    }
    return articleCache[index]!;
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(initialPage: 0),
      scrollDirection: Axis.vertical,
      onPageChanged: (value) {
        setState(() {
          index = value;
        });
      },
      itemBuilder: (context, index) {
        return FutureBuilder(
          future: getNews(index),
          builder: (BuildContext context, AsyncSnapshot<NewsArticle> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              NewsArticle newsArticle = snapshot.data!;
              return NewsContainer(
                newsUrl: newsArticle.newsUrl,
                urlToImage: newsArticle.urlToImage,
                content: newsArticle.content,
                title: newsArticle.title,
                date: newsArticle.date,
              );
            }
          },
        );
      },
    );
  }
}
