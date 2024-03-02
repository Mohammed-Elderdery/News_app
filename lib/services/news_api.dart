// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_cloud_app/models/articles_list_model.dart';

import '../models/article_model.dart';

class NewsApi {
  Future<List<Article>> fetchData() async {
    String apiKey = "dff495e34a0d446882c589733aa4456a";
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=technology&apiKey=$apiKey');
    var response = await http.get(url);
    final data = response.body;
    var jsonData = jsonDecode(data);
    Articles articles = Articles.fromjson(jsonData);
    List<Article> articleList =
        articles.articles.map((e) => Article.fromjson(e)).toList();
    return articleList;
  }
}
