// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/screens/all_channels.dart';
import 'package:news_app/view/screens/hoNews_screen.dart';
import 'package:news_app/view/screens/top_news.dart';
import 'package:news_app/service/api.dart';
import 'package:news_app/widgets/carousal.dart';
import 'package:news_app/widgets/channels.dart';
import 'package:news_app/widgets/navbar.dart';
// ignore: unused_import
import 'package:news_app/widgets/tab_bar.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<MdxNews>? mdx_news;

  @override
  void initState() {
    mdx_news = getNews();

    // TODO: implement ini
    // tState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<MdxNews>(
            future: mdx_news,
            builder: (context, AsyncSnapshot<MdxNews> snapshot) {
              return !snapshot.hasData
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: ListView(
                        children: [
                          Appbar(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Catogories",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                All_channels()));
                                  },
                                  child: const Text(
                                    "See More",
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ],
                          ),
                          channels(
                            Title: snapshot.data!,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Top News",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return top_news(
                                        url1: snapshot.data!,
                                      );
                                    }));
                                  },
                                  child: const Text(
                                    "see All",
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ],
                          ),
                          carousal(
                            url1: snapshot.data!,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Hot News",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          hot_news_screen()
                          // tabs(news: snapshot.data!),
                        ],
                      ));
            }),
      ),
    );
  }
}
