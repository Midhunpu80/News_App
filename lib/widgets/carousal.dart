import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/screens/reading_screen.dart';
import 'package:sizer/sizer.dart';

// ignore: camel_case_types
class carousal extends StatelessWidget {
  MdxNews url1;
  carousal({required this.url1});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return Reading_screen();
        // }));
      },
      child: SizedBox(
        height: 23.h,
        width: 100.w,

        ///color: Colors.brown,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 40.h,
            autoPlay: true,
            pageSnapping: true,
          ),
          items: [1, 2, 3, 4, 5, 6,7,8,9].map((i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (BuildContext context) {
                  final arc = url1.articles[i];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Reading_screen(
                                url: arc.urlToImage,
                                title: arc.title,
                                content: arc.content,
                                description: arc.description,
                                link: arc.url,
                                author: arc.author,
                                source: arc.source.name,
                                time: arc.publishedAt.minute,
                              )));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  url1.articles[i].urlToImage.toString()),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 236, 236, 236)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                child: Text(
                              url1.articles[i].title.toString(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
