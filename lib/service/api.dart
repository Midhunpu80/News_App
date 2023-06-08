// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:news_app/model/Hot_news.dart';

import 'package:news_app/model/news_model.dart';
// ignore: unused_import
import 'package:news_app/service/domain.dart';
import 'package:news_app/service/uris.dart';

Future<MdxNews> getNews() async {
  final response = await http.get(Uri.parse(uri));
  if (response.statusCode == 200) {
    var newData = mdxNewsFromJson(response.body);
    print("Data is retrieved successfully.");
    return newData;
  } else {
    print("Failed to retrieve data.");
    throw Exception("Data is not received.");
  }
}

const String uris =
    "https://newsapi.org/v2/everything?q=Hot&apiKey=6f19a0493a334135a918497576cc1e75";

Future<MdxHotNews> getHot_News() async {
  final response = await http.get(Uri.parse(uris));
  if (response.statusCode == 200) {
    var newData = mdxHotNewsFromJson(response.body);
    // ignore: avoid_print
    print("Data is retrieved successfully.");
    return newData;
  } else {
    print("Failed to retrieve data.");
    throw Exception("Data is not received.");
  }
}
