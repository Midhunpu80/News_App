// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:news_app/model/category.dart';

// ignore: unused_import
import 'package:news_app/service/domain.dart';

Future<MdxCategory> get_category_news(String cato) async {
  String cat =
      'https://newsapi.org/v2/top-headlines?country=us&category=$cato&apiKey=6f19a0493a334135a918497576cc1e75';
  final response = await http.get(Uri.parse(cat));
  if (response.statusCode == 200) {
    var newData = mdxCategoryFromJson(response.body);
    print("Data is retrieved successfully.");
    return newData;
  } else {
    print("Failed to retrieve data.");
    throw Exception("Data is not received.");
  }
}
