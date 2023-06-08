// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:news_app/model/Hot_news.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/view/screens/reading_screen.dart';
import 'package:news_app/service/api.dart';
import 'package:sizer/sizer.dart';

class hot_news_screen extends StatefulWidget {
  @override
  State<hot_news_screen> createState() => _hot_news_screenState();
}

class _hot_news_screenState extends State<hot_news_screen> {
  Future<MdxHotNews>? hottestnews;
  @override
  void initState() {
    hottestnews = getHot_News();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92.h,
      width: 100.h,
      child: FutureBuilder<MdxHotNews>(
          future: hottestnews,
          builder: (context, AsyncSnapshot<MdxHotNews> snapshot) {
            return !snapshot.hasData
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (context, index) {
                      final sre = snapshot.data!.articles[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Reading_screen(
                                url: sre.urlToImage.toString(),
                                title: sre.title.toString(),
                                content: sre.content.toString(),
                                description: sre.description.toString(),
                                link: sre.url,
                                author: sre.author,
                                source: sre.source.name.toString(),
                                time: sre.publishedAt.minute);
                          }));
                        },
                        child: SizedBox(
                          height: 15.h,
                          width: 100.w,
                          //   color: const Color.fromARGB(255, 255, 225, 0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 50,
                                  top: 80,
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 4.h,
                                          width: 17.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: const Color.fromARGB(
                                                255, 85, 59, 255),
                                          ),
                                          child: Flexible(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                snapshot.data!.articles[index]
                                                    .source.name
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold,),
                                              ),
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Container(
                                          height: 4.h,
                                          width: 12.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.amber,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${snapshot.data!.articles[index].publishedAt.hour.toString()}hrs",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              snapshot.data!.articles[index]
                                                  .urlToImage
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                          width: 60.w,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                left: 16.sp,
                                                top: 13.sp,
                                              ),
                                              child: Text(
                                                snapshot.data!.articles[index]
                                                    .title,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: 120);
          }),
    );
  }
}
