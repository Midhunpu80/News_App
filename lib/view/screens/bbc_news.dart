import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
// ignore: unused_import
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/screens/reading_screen.dart';
import 'package:news_app/service/category_api.dart';
import 'package:sizer/sizer.dart';

class bbc_news extends StatefulWidget {
  String cat;

  bbc_news({required this.cat});
  @override
  State<bbc_news> createState() => _bbc_newsState();
}

class _bbc_newsState extends State<bbc_news> {
  late Future<MdxCategory> getcat;

  ///  const MyWidget({super.key});
  // int? index1;
  @override
  void initState() {
    getcat = get_category_news(widget.cat);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.cat.toString()),
          centerTitle: true,
        ),
        body: FutureBuilder<MdxCategory>(
            future: getcat,
            builder: (context, AsyncSnapshot<MdxCategory> snapshot) {
              return !snapshot.hasData
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: 100.h,
                      width: 100.h,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            /// var article = news!.articles[index];
                            ///
                            final art = snapshot.data!.articles[index];

                            return InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Reading_screen(
                                    url: art.urlToImage,
                                    title: art.title,
                                    content: art.content,
                                    description: art.description,
                                    link: art.url,
                                    author: art.author,
                                    source: art.source.name,
                                    time: art.publishedAt.minute,
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
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: const Color.fromARGB(
                                                      255, 17, 0, 255),
                                                ),
                                                child: Flexible(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      snapshot
                                                          .data!
                                                          .articles[index]
                                                          .source
                                                          .name
                                                          .toLowerCase(),
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                      BorderRadius.circular(5),
                                                  color: Colors.amber,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "${snapshot.data!.articles[index].publishedAt.hour.toString()}hrs ago",
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255,
                                                            255,
                                                            255,
                                                            255)),
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
                                                  image: NetworkImage(snapshot
                                                      .data!
                                                      .articles[index]
                                                      .urlToImage
                                                      .toString()),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(18),
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
                                                      snapshot.data!
                                                          .articles[index].title
                                                          // news!.articles[index].title"
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                          itemCount: snapshot.data!.articles.length),
                    );
            }));
  }
}
