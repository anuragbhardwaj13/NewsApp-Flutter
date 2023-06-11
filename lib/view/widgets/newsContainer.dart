import 'package:flutter/material.dart';
import 'package:inshorts_clone/view/widgets/detail_view.dart';

class NewsContainer extends StatelessWidget {
  String urlToImage;
  String title;
  String content;
  String newsUrl;
  String date;
  NewsContainer(
      {super.key,
      required this.newsUrl,
      required this.urlToImage,
      required this.content,
      required this.title,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.network(
          urlToImage,
          height: 300,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                content != "--"
                    ? content.length > 250
                        ? content.substring(0, 250)
                        : "${content.toString().substring(0, content.length - 15)}..."
                    : content,
                style: TextStyle(fontSize: 16),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Last Updated: $date",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailViewScreen(newsUrl: newsUrl)));
                    },
                    child: Text("Read More")))
          ],
        ),
        SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
