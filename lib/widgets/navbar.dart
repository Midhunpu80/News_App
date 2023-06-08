import 'package:flutter/material.dart';
import 'package:news_app/view/screens/search.dart';
import 'package:sizer/sizer.dart';

class Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.sort,
                size: 40,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "images/Apple_News_2019_icon_(iOS).svg.png"))),
              ),
              const Text("MDX\nNEWS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                        255,
                        255,
                        17,
                        0,
                      ))),
            ],
          ),
          IconButton(
              onPressed: () {
              //   Navigator.of(context)
              //       .push(MaterialPageRoute(builder: (context) => search()));
              // },
              },
              icon: const Icon(
                Icons.search,
                size: 40,
              )),
        ],
      ),
    );
  }
}
