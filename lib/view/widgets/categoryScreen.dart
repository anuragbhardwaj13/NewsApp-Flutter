import 'package:flutter/material.dart';
import 'package:inshorts_clone/model/category.dart';
import 'package:inshorts_clone/view/widgets/category_news.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<Category> categories = [
    Category(name: "Business", apiKey: "business"),
    Category(name: "Technology", apiKey: "technology"),
    Category(name: "Entertainment", apiKey: "entertainment"),
    Category(name: "Sports", apiKey: "sports"),
    Category(name: "Health", apiKey: "health"),
    Category(name: "Science", apiKey: "science"),
    // Add more categories here...
  ];

  late Category selectedCategory;
  late List<GlobalKey> categoryKeys;

  @override
  void initState() {
    super.initState();
    selectedCategory = categories[0]; // Set initial category to General

    // Initialize the GlobalKey list inside initState()
    categoryKeys = List.generate(categories.length, (index) => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.asMap().entries.map((entry) {
                int index = entry.key;
                Category category = entry.value;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                  child: ElevatedButton(
                    key: categoryKeys[index],
                    onPressed: () {
                      setState(() {
                        selectedCategory = category;
                      });
                      Scrollable.ensureVisible(
                        categoryKeys[index].currentContext!,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (selectedCategory == category)
                          ? Theme.of(context).primaryColor
                          : const Color.fromARGB(255, 228, 228, 228),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      textStyle: TextStyle(
                        fontWeight: selectedCategory == category
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    child: Text(category.name,
                        style: TextStyle(
                            fontSize: 15,
                            color: selectedCategory == category
                                ? Colors.white
                                : Theme.of(context).primaryColor)),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(child: CategoryNews(category: selectedCategory))
        ],
      ),
    );
  }
}
