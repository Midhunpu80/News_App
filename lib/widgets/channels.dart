import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/screens/bbc_news.dart';
import 'package:sizer/sizer.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class channels extends StatelessWidget {
  MdxNews Title;
  String cat1 = 'sports';
  String cat2 = 'health';
  String cat3 = 'entertainment';
  String cat4 = 'science';
  String cat5 = 'technology';

  // ignore: non_constant_identifier_names
  channels({required this.Title});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 18.h,
        //   color: Colors.red,
        width: double.infinity,
        child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 4, right: 5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => bbc_news(cat: cat1)));
                    },
                    child: Container(
                      child: col(text: 'sports', img: 'images/sports.jpeg'),
                    )),
                const SizedBox(
                  width: 13,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => bbc_news(cat: cat2)));
                    },
                    child: Container(
                      child: col(text: 'health', img: 'images/health.jpeg'),
                    )),
                const SizedBox(
                  width: 13,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => bbc_news(cat: cat3)));
                    },
                    child: Container(
                      child: col(text: 'entertainment', img: 'images/ent.jpeg'),
                    )),
                const SizedBox(
                  width: 13,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => bbc_news(cat: cat4)));
                    },
                    child: Container(
                      child: col(text: 'science', img: "images/science.jpg"),
                    )),
                const SizedBox(
                  width: 13,
                ),
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
            )));
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
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ))
      ],
    );
  }
}
