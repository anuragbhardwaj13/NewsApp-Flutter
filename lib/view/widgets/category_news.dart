import 'package:flutter/material.dart';
import 'package:inshorts_clone/model/category.dart';
import 'package:inshorts_clone/view/widgets/news_list.dart';

class CategoryNews extends StatelessWidget {
  final Category category;

  CategoryNews({required this.category});

  @override
  Widget build(BuildContext context) {
    return NewsList(key: ValueKey(category.apiKey), category: category);
  }
}