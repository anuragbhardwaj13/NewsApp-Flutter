import 'package:flutter/material.dart';
import 'package:inshorts_clone/model/category.dart';
import 'package:inshorts_clone/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saransa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 100, 206, 255)),
        useMaterial3: true,
      ),
      home: HomeScreen(category: Category(name: "General", apiKey: "general")),
    );
  }
}
