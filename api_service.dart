import 'dart:convert';
import 'package:newsapp2/model/article_model.dart';
import 'package:http/http.dart';

class ApiService {

  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ea909502f2e64d089eea4fdab73e31b3";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
