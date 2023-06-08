// import 'package:flutter/material.dart';
// import 'package:news_app/model/category.dart';
// import 'package:news_app/model/news_model.dart';
// import 'package:news_app/screens/tab_screen.dart';
// import 'package:news_app/service/category_api.dart';
// import 'package:news_app/service/domain.dart';
// import 'package:sizer/sizer.dart';

// MdxCategory? cat;


// class tabs extends StatefulWidget {
//   MdxNews? news;
//   tabs({required this.news});

//   @override
//   State<tabs> createState() => _tabsState();
// }

// late Future<MdxCategory> Categoryies;

// class _tabsState extends State<tabs> {
//   @override
//   void initState() {
//     Categoryies = get_category_news();

//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: SizedBox(
//         //   color: Colors.red,
//         height: 100.h,
//         width: 100.w,
//         child: FutureBuilder<MdxCategory>(
//             future: Categoryies,
//             builder: (context, AsyncSnapshot<MdxCategory> snapshot) {
//               return !snapshot.hasData
//                   ? Center(child: CircularProgressIndicator())
//                   : DefaultTabController(
//                       length: 6,
//                       child: Scaffold(
//                           appBar: AppBar(
//                             toolbarHeight: 5.h,
//                             leadingWidth: 10.w,
//                             bottom: const TabBar(
//                               labelColor: Colors.amber,
//                               indicatorColor: Colors.redAccent,
//                               indicatorWeight: 2,
//                               tabs: [
//                                 Tab(
//                                   text: "General",
//                                 ),
//                                 Tab(
//                                   text: "Technology",
//                                 ),
//                                 Tab(
//                                   text: "buissness",
//                                 ),
//                                 Tab(
//                                   text: "entertainment",
//                                 ),
//                                 Tab(
//                                   text: "health",
//                                 ),
//                                 Tab(
//                                   text: "health",
//                                 ),
//                               ],
//                             ),
//                           ),
//                           body: TabBarView(children: [
//                             tab_screens(
//                               news: snapshot.data!,
//                             ),
//                             tab_screens(
//                               news: snapshot.data!,
//                             ),
//                             tab_screens(
//                               news: snapshot.data!,
//                             ),
//                             tab_screens(
//                               news: snapshot.data!,
//                             ),
//                             tab_screens(
//                               news: snapshot.data!,
//                             ),
//                             tab_screens(
//                               news: snapshot.data!,
//                             ),
//                           ])));
//             }),
//       ),
//     );
//   }
// }
