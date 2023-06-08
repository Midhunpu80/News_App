import 'dart:io';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:news_app/widgets/navbar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

class Reading_screen extends StatelessWidget {
  dynamic url;
  dynamic title;
  dynamic content;
  dynamic description;
  dynamic link;
  dynamic author;
  dynamic time;
  dynamic source;

  Reading_screen(
      {required this.url,
      required this.title,
      required this.content,
      required this.description,
      required this.link,
      required this.author,
      required this.source,
      required this.time});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: SizedBox(
                height: 7.h,
                width: 10.w,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 30.h,
              width: 10.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover),
                color: const Color.fromARGB(255, 190, 184, 255),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              height: 3.h,
              width: 10.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        source,
                        style:const  TextStyle(fontSize: 12),
                      ),
                      const Icon(
                        Icons.circle,
                        color: Colors.black,
                        size: 10,
                      ),
                      // Text(author.toString()),
                    ],
                  ),
                  Text("${time}minutes ago"),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
            child: SizedBox(
              height: 10.h,
              width: 10.w,
              child: Text(
                content,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
            ),
            child: SizedBox(
              height: 20.h,
              width: 10.w,
              child: Text(
                description,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
            child: ElevatedButton.icon(
              onPressed: () async{
          await share(link);
              },
              icon: const Icon(
                Icons.read_more,
                color: Colors.white,
              ),
              label: const Text(
                "Read More",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
            ),
          )
        ],
      ),
    );
  }

  share(String linked) {
    return Share.share(linked);
  }
}
