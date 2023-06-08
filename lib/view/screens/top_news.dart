import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/screens/reading_screen.dart';
import 'package:sizer/sizer.dart';

class top_news extends StatelessWidget {
  ///  cotopnst MyWidget({super.key});
  ///
  MdxNews url1;

  top_news({required this.url1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Top News"),
          centerTitle: true,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              final urs = url1.articles[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Reading_screen(
                      url: urs.urlToImage,
                      title: urs.title,
                      content: urs.content,
                      description: urs.description,
                      link: urs.url,
                      author: urs.author,
                      time: urs.publishedAt.minute,
                      source: urs.source.name,
                    );
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
                                    borderRadius: BorderRadius.circular(5),
                                    color:
                                        const Color.fromARGB(255, 0, 34, 255),
                                  ),
                                  child: Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        url1.articles[index].source.name
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
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
                                    borderRadius: BorderRadius.circular(5),
                                    color:
                                        const Color.fromARGB(255, 255, 191, 0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${url1.articles[index].publishedAt.hour.toString()}hrs",
                                      style:
                                          const TextStyle(color: Colors.white),
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
                                      url1.articles[index].urlToImage
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
                                        "${url1.articles[index].title.toString()}\n",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
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
            itemCount: url1.articles.length));
  }
}
