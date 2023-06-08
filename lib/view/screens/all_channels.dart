import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/view/screens/bbc_news.dart';
import 'package:news_app/service/category_api.dart';

class All_channels extends StatelessWidget {
  String cat1 = 'sports';
  String cat2 = 'health';
  String cat3 = 'entertainment';
  String cat4 = 'science';
  String cat5 = 'technology';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        // ignore: avoid_unnecessary_containers
        child:

            // ignore: avoid_unnecessary_containers
            Container(
                child: GridView.count(
          crossAxisCount: 3,
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => bbc_news(cat: cat1)));
                },
                child: Container(
                  child: col(text: 'sports', img: 'images/sports.jpeg'),
                )),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => bbc_news(cat: cat2)));
                },
                child: Container(
                  child: col(text: 'health', img: 'images/health.jpeg'),
                )),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => bbc_news(cat: cat3)));
                },
                child: Container(
                  child: col(text: 'entertainment', img: 'images/ent.jpeg'),
                )),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => bbc_news(cat: cat4)));
                },
                child: Container(
                  child: col(text: 'science', img: "images/science.jpg"),
                )),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => bbc_news(cat: cat5)));
                },
                child: Container(
                  child: col(
                    text: 'technology',
                    img: "images/tech.jpg",
                  ),
                ))
          ],
        )),
      ),
    );
  }
}

col({required String text, required dynamic img}) {
  return Column(
    children: [
      Container(
        height: 94,
        width: 95,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromARGB(255, 43, 0, 255),
        ),
      ),
      Expanded(
          child: Text(
        text,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ))
    ],
  );
}
