// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:news_app/model/search_model.dart';

// ignore: unused_import
import 'package:news_app/service/domain.dart';

Future<MdxSearch> get_search_news(String search) async {
  String uri =
     'https://newsapi.org/v2/everything?q=english&q=$search&apiKey=6f19a0493a334135a918497576cc1e75';
  final response = await http.get(Uri.parse(uri));
  if (response.statusCode == 200) {
    var newData = mdxSearchFromJson(response.body);
    // ignore: avoid_print
    print("Data is retrieved successfully.");
    return newData;
  } else {
    // ignore: avoid_print
    print("Failed to retrieve data.");
    throw Exception("Data is not received.");
  }
}
