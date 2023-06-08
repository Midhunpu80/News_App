// // ignore_for_file: non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:news_app/model/search_model.dart';
// import 'package:news_app/service/search_news.dart';
// import 'package:sizer/sizer.dart';

// class search extends StatefulWidget {
//   @override
//   State<search> createState() => _searchState();
// }

// late Future<MdxSearch> get_news;

// class _searchState extends State<search> {
//   TextEditingController controll = TextEditingController();

//   String? query ="notfind";
//   @override
//   void initState() {
//     get_news = get_search_news(query!);
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: FutureBuilder<MdxSearch>(
//             future: get_news,
//             builder: (context, AsyncSnapshot<MdxSearch> snapshot) {
//               return !snapshot.hasData
//                   ? const Center(child: CircularProgressIndicator())
//                   : ListView(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 10, right: 10, top: 20),
//                           child: SizedBox(
//                             height: 45,
//                             child: TextFormField(
//                               onChanged: (value) {
//                                 value = query!;
//                               },
//                               controller: controll,
//                               decoration: const InputDecoration(
//                                   filled: true,
//                                   hintText: "search your favorite news",
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(10),
//                                         topRight: Radius.circular(10),
//                                         bottomLeft: Radius.circular(10),
//                                         bottomRight: Radius.circular(10)),
//                                     borderSide: BorderSide.none,
//                                   )),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 10, right: 10, top: 10),
//                           child: SizedBox(
//                             height: 700,
//                             width: 100,
//                             child: ListView.separated(
//                                 itemBuilder: (context, index) {
//                                   final sr = snapshot.data!.articles[index];

//                                   ///     final sre = snapshot.data!.articles[index];
//                                   return InkWell(
//                                     onTap: () {
//                                       // Navigator.of(context)
//                                       //     .push(MaterialPageRoute(builder: (context) {
//                                       //   return Reading_screen(
//                                       //       url: sre.urlToImage.toString(),
//                                       //       title: sre.title.toString(),
//                                       //       content: sre.content.toString(),
//                                       //       description: sre.description.toString(),
//                                       //       link: sre.url,
//                                       //       author: sre.author,
//                                       //       source: sre.source.name.toString(),
//                                       //       time: sre.publishedAt.minute);
//                                       // }));
//                                     },
//                                     child: SizedBox(
//                                       height: 15.h,
//                                       width: 100.w,
//                                       //   color: const Color.fromARGB(255, 255, 225, 0),
//                                       child: Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 14),
//                                         child: Stack(
//                                           children: [
//                                             Positioned(
//                                               right: 50,
//                                               top: 80,
//                                               child: Row(
//                                                 children: [
//                                                   Container(
//                                                       height: 4.h,
//                                                       width: 17.w,
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(6),
//                                                         color: const Color
//                                                                 .fromARGB(
//                                                             255, 85, 59, 255),
//                                                       ),
//                                                       child: Flexible(
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(8.0),
//                                                           child: Text(
//                                                             sr.title.toString(),
//                                                             style:
//                                                                 const TextStyle(
//                                                               color:
//                                                                   Colors.white,
//                                                               fontSize: 9,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       )),
//                                                   const SizedBox(
//                                                     width: 25,
//                                                   ),
//                                                   Container(
//                                                       height: 4.h,
//                                                       width: 12.w,
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(6),
//                                                         color: Colors.amber,
//                                                       ),
//                                                       child: const Padding(
//                                                         padding:
//                                                             EdgeInsets.all(8.0),
//                                                         child: Text(
//                                                           "hrs",
//                                                           style: TextStyle(
//                                                               color:
//                                                                   Colors.white),
//                                                         ),
//                                                       ))
//                                                 ],
//                                               ),
//                                             ),
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   height: 100,
//                                                   width: 100,
//                                                   decoration: BoxDecoration(
//                                                     image: DecorationImage(
//                                                         image: NetworkImage(
//                                                           sr.urlToImage
//                                                               .toString(),
//                                                         ),
//                                                         fit: BoxFit.cover),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             18),
//                                                   ),
//                                                 ),
//                                                 Column(
//                                                   children: [
//                                                     SizedBox(
//                                                       height: 10.h,
//                                                       width: 60.w,
//                                                       child: Padding(
//                                                           padding:
//                                                               EdgeInsets.only(
//                                                             left: 16.sp,
//                                                             top: 13.sp,
//                                                           ),
//                                                           child: Text(
//                                                             sr.title.toString(),
//                                                             overflow:
//                                                                 TextOverflow
//                                                                     .ellipsis,
//                                                             maxLines: 2,
//                                                           )),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 separatorBuilder: (context, index) {
//                                   return const Divider();
//                                 },
//                                 itemCount: 120),
//                           ),
//                         )
//                       ],
//                     );
//             }),
//       ),
//     );
//   }
// }
