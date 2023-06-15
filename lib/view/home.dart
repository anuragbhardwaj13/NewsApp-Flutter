import 'package:flutter/material.dart';
import 'package:inshorts_clone/model/category.dart';
import 'package:inshorts_clone/view/widgets/categoryScreen.dart';
import 'package:inshorts_clone/view/widgets/news_list.dart';

class HomeScreen extends StatelessWidget {
  final Category category;

  HomeScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("सारांश"),
        centerTitle: true, // Center align the title
        elevation: 0,
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryScreen(),
              ),
            );
          }
        },
        child: Scaffold(
          body: NewsList(category: category),
        ),
      ),
    );
  }
}
