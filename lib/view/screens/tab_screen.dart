// import 'package:flutter/material.dart';
// import 'package:news_app/model/category.dart';
// import 'package:news_app/model/news_model.dart';
// import 'package:news_app/screens/reading_screen.dart';
// import 'package:sizer/sizer.dart';

// class tab_screens extends StatelessWidget {
//   MdxCategory? news;
//   tab_screens({required this.news});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100.h,
//       width: 100.h,
//       child: ListView.separated(
//           itemBuilder: (context, index) {
//             return InkWell(
//               onTap: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) {
//                   return Reading_screen();
//                 }));
//               },
//               child: SizedBox(
//                 height: 15.h,
//                 width: 100.w,
//                 //   color: const Color.fromARGB(255, 255, 225, 0),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 14),
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         right: 50,
//                         top: 80,
//                         child: Row(
//                           children: [
//                             Container(
//                                 height: 3.h,
//                                 width: 17.w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: const Color.fromARGB(255, 85, 59, 255),
//                                 ),
//                                 child: Flexible(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       news!.sources[index].name.toString(),
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 8,
//                                       ),
//                                     ),
//                                   ),
//                                 )),
//                             const SizedBox(
//                               width: 25,
//                             ),
//                             Container(
//                                 height: 3.h,
//                                 width: 17.w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.amber,
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     news!.sources[index].name.toString(),
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ))
//                           ],
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             height: 100,
//                             width: 100,
//                             decoration: BoxDecoration(
//                               //   image: DecorationImage(
//                               //       image: NetworkImage(
//                               //            news!.sources[index].
//                               //             .toString(),
//                               //       ),
//                               // fit: BoxFit.cover),
//                               borderRadius: BorderRadius.circular(18),
//                             ),
//                           ),
//                           Column(
//                             children: [
//                               SizedBox(
//                                 height: 10.h,
//                                 width: 60.w,
//                                 child: Padding(
//                                     padding: EdgeInsets.only(
//                                       left: 16.sp,
//                                       top: 13.sp,
//                                     ),
//                                     child: Text(
//                                       news!.sources[index].name.toString(),
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 3,
//                                     )),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//           separatorBuilder: (context, index) {
//             return const Divider();
//           },
//           itemCount: news!.sources.length),
//     );
//   }
// }
